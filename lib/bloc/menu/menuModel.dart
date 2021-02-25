class MenuModel {
  final menuid;
  final resid;
  final rowCount;
  final resname;
  final menuname;
  final category;
  final price;
  final image;

  MenuModel(this.menuid, this.rowCount, this.price, this.menuname,
      this.category, this.image, this.resid, this.resname);

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      json['menuid'],
      json['rowCount'],
      json['price'],
      json['menuname'],
      json['category'],
      json['image'],
      json['resid'],
      json['resname'],
    );
  }
}
