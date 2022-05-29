class ModelClass {
  final String image;
  final String percent;
  final String title1;
  final String title2;

  ModelClass(
      {required this.title2,
      required this.title1,
      required this.percent,
      required this.image});

  factory ModelClass.fromJson(Map<String, dynamic> modelist) {
    return ModelClass(
      image: modelist['image'],
      percent: modelist['percent'],
      title1: modelist['title1'],
      title2: modelist['title2'],
    );
  }
}
