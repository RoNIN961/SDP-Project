class RecipeModel {
  final title;
  final recipeid;
  final rowCount;
  final username;
  final category;
  final userid;
  final image;

  RecipeModel(
    this.title,
    this.recipeid,
    this.rowCount,
    this.username,
    this.category,
    this.userid,
    this.image,
  );

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      json['title'],
      json['recipeid'],
      json['rowCount'],
      json['username'],
      json['category'],
      json['userid'],
      json['image'],
    );
  }
}
