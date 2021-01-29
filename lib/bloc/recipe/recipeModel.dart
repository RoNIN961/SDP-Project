class RecipeModel {
  final title;
  final rowCount;
  final author;
  final details;
  final ingredients;
  final image;
  final category;
  final step;

  RecipeModel(this.title, this.rowCount, this.author, this.details,
      this.ingredients, this.category, this.image, this.step);

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
        json['Recipe_Title'],
        json['rowCount'],
        json['Username'],
        json['Detail'],
        json['Ingredient'],
        json['Category'],
        json['Directory'],
        json['Step']);
  }
}
