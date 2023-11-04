import 'dart:convert';

import 'package:blockieio3/player.dart';
import 'package:blockieio3/socket.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'UI/dxdy_joystick.dart';
import 'UI/inventory.dart';
import 'UI/theta_joystick.dart';
import 'game.dart';

void main() async {
  socket.stream.listen((rawMsg) async {
    Map<String, dynamic> msg = jsonDecode(rawMsg);
    //print(msg);
    if (msg['type'] == 'registered') {
      runApp(const MyApp());
    } else if (msg['type'] == 'gameState') {
      gameState = msg;
    } else {
      //print("data of type: ${msg['type']}is not supported.");
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            MouseRegion(
              child: GameWidget(game: MyGame()),
            ),
            const ThetaJoystick(),
            const VelocityJoystick(),
            InventoryBar()
          ],
        ),
      ),
    );
  }
}
