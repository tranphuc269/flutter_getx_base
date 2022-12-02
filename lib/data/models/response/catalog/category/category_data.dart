class CategoryData {
  CategoryData(
      {required this.imgUrl,
      required this.id,
      required this.name,
      required this.description});

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      imgUrl: json['imgUrl'],
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  String id;
  String name;
  String imgUrl;
  String description;
}
