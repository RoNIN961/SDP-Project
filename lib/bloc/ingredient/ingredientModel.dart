class IngredientModel {
  final rowCount;
  final recipeid;
  final ingredient;

  IngredientModel(
    this.recipeid,
    this.rowCount,
    this.ingredient,
  );

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
      json['recipeid'],
      json['rowCount'],
      json['ingredient'],
    );
  }
}
