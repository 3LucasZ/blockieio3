import asyncio
import websockets
import sys
import GameModule
import utils

config = utils.get_config()
IP = config["WS_SERVER_CONFIG"]["IP"]
PORT = config["WS_SERVER_CONFIG"]["PORT"]

gameState = GameModule.Game()
if __name__ == "__main__":
    try:
        print("Starting the server...")
        loop = asyncio.get_event_loop()
        start_server = websockets.serve(gameState.handle_new_connection, "", PORT)
        asyncio.ensure_future(start_server)
        asyncio.ensure_future(gameState.start_game_loop())
        loop.run_forever()

    except KeyboardInterrupt:
        sys.exit()
