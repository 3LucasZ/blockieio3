import 'dart:convert';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'UI/constants.dart';

//Create the socket
WebSocketChannel socket = WebSocketChannel.connect(Uri.parse('ws://$serverIP:$serverPort'));
Map<String, dynamic> gameState = {
  "players": [],
};

//Socket converters
SpriteComponent convert_player(Map<String, dynamic> playerState){
  return SpriteComponent(sprite: Sprite(Flame.images.fromCache('player.png')),position: Vector2(150,100), angle: playerState["theta"], size: Vector2.all(128), anchor: Anchor.center);
}

//Socket publishers
void publish_dx(double dx) {
  Map<String, dynamic> msg = {
    'type': 'dx',
    'data': dx,
  };
  socket.sink.add(jsonEncode(msg));
}
void publish_dy(double dy) {
  Map<String, dynamic> msg = {
    'type': 'dy',
    'data': dy,
  };
  socket.sink.add(jsonEncode(msg));
}
void publish_theta(double theta){
  Map<String, dynamic> msg = {
    'type': 'theta',
    'data': theta,
  };
  socket.sink.add(jsonEncode(msg));
}
