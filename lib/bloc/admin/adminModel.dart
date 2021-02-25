class AdminModel {
  final rowCount;
  final total;
  final totaladmin;
  final totaluser;
  final totalrestaurant;
  final totalmenu;
  final totalmaindish;
  final totaldrink;
  final totalsnack;
  final totalrecipe;
  final totalhalal;
  final totalnonhalal;

  AdminModel(
    this.rowCount,
    this.total,
    this.totaladmin,
    this.totaluser,
    this.totalrestaurant,
    this.totalmenu,
    this.totalmaindish,
    this.totaldrink,
    this.totalsnack,
    this.totalrecipe,
    this.totalhalal,
    this.totalnonhalal,
  );

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      json['rowCount'],
      json['total'],
      json['totaladmin'],
      json['totaluser'],
      json['totalrestaurant'],
      json['totalmenu'],
      json['totalmaindish'],
      json['totaldrink'],
      json['totalsnack'],
      json['totalrecipe'],
      json['totalhalal'],
      json['totalnonhalal'],
    );
  }
}
