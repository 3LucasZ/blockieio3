import json


class Player:
    def __init__(self, id, websocket):
        self.websocket = websocket

        self.id = id
        self.username = "bot"
        self.x = 0
        self.y = 0
        self.theta = 0
        self.dx = 0
        self.dy = 0
        self.selected = "wood"
        self.health = 100

    async def periodic(self, gameState: str):
        self.x += self.dx * 15
        self.y += self.dy * 15

        await self.websocket.send(gameState)

    def toMap(self):
        return {
            "id": self.id,
            "username": self.username,
            "x": self.x,
            "y": self.y,
            "theta": self.theta,
            "dx": self.dx,
            "dy": self.dy,
            "selected": "wood",
            "health": 100,
        }

    def toJson(self):
        return json.dumps(self.toMap())
