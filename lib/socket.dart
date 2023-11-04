import 'dart:convert';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'constants.dart';
import 'objects/player_component.dart';

//Create the socket
WebSocketChannel socket =
    WebSocketChannel.connect(Uri.parse('ws://$serverIP:$serverPort'));
Map<String, dynamic> gameState = {
  "players": [],
};

//Socket converters
SpriteComponent convert_player(Map<String, dynamic> playerState) {
  return PlayerComponent(
      position: Vector2(playerState["x"], playerState["y"]),
      angle: playerState["theta"],
      health: 50,
      selected: playerState["selected"]);
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

void publish_theta(double theta) {
  Map<String, dynamic> msg = {
    'type': 'theta',
    'data': theta,
  };
  socket.sink.add(jsonEncode(msg));
}

void publish_selected(String selected) {
  Map<String, dynamic> msg = {
    'type': 'selected',
    'data': selected,
  };
  socket.sink.add(jsonEncode(msg));
}
