class HomeRecipeModel {
  final rowCount;
  final username;
  final recipeid;
  final title;
  final image;

  HomeRecipeModel(
    this.rowCount,
    this.username,
    this.recipeid,
    this.title,
    this.image,
  );

  factory HomeRecipeModel.fromJson(Map<String, dynamic> json) {
    return HomeRecipeModel(
      json['rowCount'],
      json['username'],
      json['recipeid'],
      json['title'],
      json['image'],
    );
  }
}
