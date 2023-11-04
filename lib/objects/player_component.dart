import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';

import '../style.dart';
import 'health_bar.dart';

class PlayerComponent extends SpriteComponent {
  PlayerComponent({required Vector2 position, required double angle, required int health}):
      super(sprite: Sprite(Flame.images.fromCache('player.png')),position: position, angle: angle, size: Vector2(100,100), anchor: Anchor.center, children: [HealthBar(health: health)]);
}

