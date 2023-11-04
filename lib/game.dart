import 'package:blockieio3/socket.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';

Future<void> loadAssets() async {
  await Flame.images.load('player.png');
  await Flame.images.load('grass_tile.jpeg');
  await Flame.images.load('wood_tile.jpeg');
  await Flame.images.load('spike.png');
  await Flame.images.load('arrow.png');
  await Flame.images.load('none.png');
  await Flame.images.load('katana.png');
  await Flame.images.load('bow.png');
}

class MyGame extends FlameGame {
  List<Component> spriteComponents = [];
  @override
  Color backgroundColor() => const Color(0xffa1ef8b);
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await loadAssets();
  }
  @override
  void update(double dt) {
    super.update(dt);
    removeAll(spriteComponents);
    spriteComponents.clear();
    for (Map<String, dynamic> player in gameState["players"]){
      SpriteComponent next = convert_player(player);
      spriteComponents.add(next);
      add(next);
    }
  }
}