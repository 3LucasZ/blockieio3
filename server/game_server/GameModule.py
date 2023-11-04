import asyncio
import json
import time
import PlayerModule
import utils

config = utils.get_config()


class Game:
    def __init__(self):
        self.fps = config["GAME_CONFIG"]["FPS"]

        self.players = []
        self.objects = []
        self.projectiles = []

        self.nextPlayerId = 1
        self.nextObjectId = 1
        self.nextProjectileId = 1

    def toJson(self):
        dict = {
            "type": "gameState",
            "cx": 0,
            "cy": 0,
            "players": [player.toMap() for player in self.players],
            "timeStamp": time.time(),
        }
        # print(dict)
        return json.dumps(dict)

    async def handle_new_connection(self, newWebsocket, path):
        print("new connection:", newWebsocket)
        self.nextPlayerId += 1

        # setup new player
        newPlayer = PlayerModule.Player(id=self.nextPlayerId, websocket=newWebsocket)
        self.players.append(newPlayer)
        await newPlayer.websocket.send(
            json.dumps(
                {
                    "type": "registered",
                    "data": 1,
                }
            )
        )

        # create a listener for the connection
        await self.listen_to(newPlayer)

    async def listen_to(self, player):
        while True:
            try:
                newJsonData = await player.websocket.recv()
                # print("recv:", newJsonData)
                newData = json.loads(newJsonData)
                if newData["type"] == "theta":
                    player.theta = newData["data"]
                elif newData["type"] == "dx":
                    player.dx = newData["data"]
                elif newData["type"] == "dy":
                    player.dy = newData["data"]
                else:
                    print("the received json data is unsupported.")
            except:
                continue

    async def start_game_loop(self):
        while True:
            await self.periodic()
            await asyncio.sleep(1 / self.fps)

    async def periodic(self):
        for player in self.players:
            await player.periodic(self.toJson())
