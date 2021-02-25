class RestaurantModel {
  final resname;
  final rowCount;
  final address;
  final email;
  final number;
  final image;
  final id;
  final username;

  RestaurantModel(this.resname, this.rowCount, this.address, this.email,
      this.number, this.image, this.id, this.username);

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      json['Restaurant_Name'],
      json['rowCount'],
      json['Address'],
      json['Email'],
      json['Contact'],
      json['Rest_Profile_Pic'],
      json['Restaurant_ID'],
      json['Username'],
    );
  }
}
