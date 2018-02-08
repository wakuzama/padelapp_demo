class Category{
  final String type;
  final String ages;

  const Category({this.type, this.ages});
}

const kCategory = const <Category>[
  const Category(
      type: 'Benjamin',
      ages:' < 10'
  ),
  const Category(
      type: 'Alevin',
      ages:' 10 - 11 '
  ),
  const Category(
      type: 'Infantil',
      ages:' 12 - 13 '
  ),
  const Category(
      type: 'Cadete',
      ages:' 14 - 15 '
  ),
  const Category(
      type: 'Juvenil',
      ages:' 16 - 17 '
  ),const Category(
      type: 'Sub-23',
      ages:' 18 - 22  '
  ),
  const Category(
      type: 'Absoluto',
      ages:' 23 - 33 '
  ),
  const Category(
      type: 'Veterano +35',
      ages:' 34 - 38 '
  ),
  const Category(
      type: 'Veterano +40',
      ages:' 39 - 43 '
  ),
  const Category(
      type: 'Veterano +45',
      ages:' 44 - 48 '
  ),
  const Category(
      type: 'Veterano +50',
      ages:' 49 - 53 '
  ),
  const Category(
      type: 'Veterano +55',
      ages:' >= 54 '
  ),
];