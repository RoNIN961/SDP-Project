class RestaurantModel {
  final resName;
  final resEmail;
  final resAddress;
  final rowCount;

  RestaurantModel(this.resName, this.resAddress, this.resEmail, this.rowCount);

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(json['resName'], json['resAddress'],
        json['resEmail'], json['rowCount']);
  }
}
