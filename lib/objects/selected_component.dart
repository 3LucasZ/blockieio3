import 'dart:ui';

import 'package:blockieio3/objects/object_meta.dart';
import 'package:blockieio3/objects/player_component.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class SelectedComponent extends SpriteComponent with ParentIsA<PlayerComponent>{
  SelectedComponent({required GameObjectMeta meta})
      : super(
            sprite: Sprite(Flame.images.fromCache(meta.image)),
            size: Vector2(meta.width, meta.height),
            anchor: Anchor.centerLeft);

  @override
  void onLoad() {
    position = Vector2(parent.width/2 + 30, parent.height/2);
  }
}
