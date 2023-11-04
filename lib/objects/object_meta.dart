class GameObjectMeta {
  final String name;
  final String image;
  final double height;
  final double width;
  final Function place;

  GameObjectMeta(
      {required this.name,
      required this.image,
      required this.height,
      required this.width,
      required this.place});
}

//tiles
GameObjectMeta grassMeta = GameObjectMeta(
    name: 'grass',
    image: 'grass_tile.jpeg',
    height: 100,
    width: 100,
    place: () {});
GameObjectMeta woodMeta = GameObjectMeta(
    name: 'wood', image: 'wood_tile.jpeg', height: 100, width: 100, place: () {});
//misc
GameObjectMeta noneMeta = GameObjectMeta(
    name: 'none', image: 'none.png', height: 100, width: 100, place: () {});
//spinning
GameObjectMeta spikeMeta = GameObjectMeta(
  name: 'spike',
  image: 'spike.png',
  height: 100,
  width: 100,
  place: () {},
);
//tools
GameObjectMeta bowMeta = GameObjectMeta(
  name: 'bow',
  image: 'bow.png',
  height: 100,
  width: 44,
  place: () {},
);
GameObjectMeta katanaMeta = GameObjectMeta(
  name: 'katana',
  image: 'katana.png',
  height: 120,
  width: 24,
  place: () {},
);

//projectiles
GameObjectMeta arrowMeta = GameObjectMeta(
  name: 'arrow',
  image: 'arrow.png',
  height: 20,
  width: 100,
  place: () {},
);

GameObjectMeta getMetaByName(String name) {
  if (name == 'wood') {
    return woodMeta;
  } else if (name == 'grass') {
    return grassMeta;
  } else if (name == 'spike') {
    return spikeMeta;
  } else if (name == 'bow') {
    return bowMeta;
  } else if (name == 'arrow') {
    return arrowMeta;
  } else if (name == 'katana') {
    return katanaMeta;
  } else {
    //print(name + ' not found!');
    return noneMeta;
  }
}
