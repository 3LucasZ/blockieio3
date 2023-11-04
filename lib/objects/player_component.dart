import 'dart:ui';

import 'package:blockieio3/objects/selected_component.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';

import '../style.dart';
import 'health_bar.dart';
import 'object_meta.dart';

class PlayerComponent extends SpriteComponent {
  @override
  final double width = 100;
  @override
  final double height = 100;

  PlayerComponent(
      {required Vector2 position,
      required double angle,
      required int health,
      required String selected})
      : super(
            sprite: Sprite(Flame.images.fromCache('player.png')),
            position: position,
            angle: angle,

            anchor: Anchor.center,
            children: [
              HealthBar(health: health),
              SelectedComponent(meta: getMetaByName(selected))
            ]);

  @override
  void onLoad() {
    size =  Vector2(width, height);
  }
}
