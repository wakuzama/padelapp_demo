class Level{
  final String levelName;
  final String levelVal;

  const Level({this.levelName, this.levelVal});
}

const kLevel = const <Level>[
  const Level(
      levelName: 'Beginner',
      levelVal:' 1'
  ),
  const Level(
      levelName: 'Intermediate',
      levelVal:' 2'
  ),
  const Level(
      levelName: 'High Intermediate',
      levelVal:' 3'
  ),
  const Level(
      levelName: 'Advanced',
      levelVal:' 4'
  ),
  const Level(
      levelName: 'Comptetition',
      levelVal:' 5'
  ),
  const Level(
      levelName: 'Professional',
      levelVal:' 6'
  ),
];