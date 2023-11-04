class GameObjectMeta {
  final String name;
  final String image;
  final String type;
  final double height;
  final double width;
  final Function activate;
  GameObjectMeta(
      {required String name,
        required String image,
        required String type,
        required Function activate,
        double height = 50,
        double width = 50})
      : name = name,
        image = image,
        type = type,
        activate = activate,
        height = height,
        width = width;
}

//tiles
GameObjectMeta grassMeta = GameObjectMeta(
  name: 'grass',
  image: 'grass_tile.jpeg',
  type: 'placeable',
  activate: () {

  },
);
GameObjectMeta woodMeta = GameObjectMeta(
  name: 'wood',
  image: 'wood_tile.jpeg',
  type: 'placeable',
  activate: () {

  },
);
//misc
GameObjectMeta noneMeta = GameObjectMeta(
  name: 'none',
  image: 'none.png',
  type: 'none',
  activate: () {},
);
//spinning
GameObjectMeta spikeMeta =  GameObjectMeta(
  name: 'spike',
  image: 'spike.png',
  type: 'placeable',
  activate: () {

  },
);
//tools
GameObjectMeta bowMeta =  GameObjectMeta(
  name: 'bow',
  image: 'bow.png',
  type: 'tool',
  height: 50,
  width: 22,
  activate: () {

  },
);
GameObjectMeta katanaMeta =  GameObjectMeta(
  name: 'katana',
  image: 'katana.png',
  type: 'tool',
  height: 120,
  width: 24,
  activate: () {

  },
);

//projectiles
GameObjectMeta arrowMeta =  GameObjectMeta(
  name: 'arrow',
  image: 'arrow.png',
  type: 'projectile',
  height: 10,
  width: 50,
  activate: () {},
);