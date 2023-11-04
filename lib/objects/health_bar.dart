import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';

import '../style.dart';

class HealthBar extends PositionComponent {

  int health;

  @override
  final double height = 100;

  @override
  final double width = 15;

  final double margin = 35;

  HealthBar({required this.health}):super(anchor: Anchor.center);

  @override
  void render(Canvas canvas){
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(position.x - margin, position.y, width, height),
            const Radius.circular(2.5)),
        Palette.grey2.paint());
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromLTWH(
                  position.x - margin, position.y, width, height * (health / 100)),
              const Radius.circular(2.5)),
          health >= 66
              ? Palette.green2.paint()
              : health >= 33
              ? Palette.yellow.paint()
              : Palette.red2.paint());
    super.render(canvas);
  }
}