class HomeRestaurantModel {
  final rowCount;
  final resid;
  final resname;
  final address;
  final contact;
  final image;
  final email;

  HomeRestaurantModel(
    this.rowCount,
    this.resid,
    this.resname,
    this.address,
    this.contact,
    this.image,
    this.email,
  );

  factory HomeRestaurantModel.fromJson(Map<String, dynamic> json) {
    return HomeRestaurantModel(
      json['rowCount'],
      json['resid'],
      json['resname'],
      json['address'],
      json['contact'],
      json['image'],
      json['email'],
    );
  }
}
