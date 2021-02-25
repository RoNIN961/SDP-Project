class ResTotalModel {
  final rowCount;
  final totalmenu;
  final totalreserve;

  ResTotalModel(
    this.rowCount,
    this.totalmenu,
    this.totalreserve,
  );
  factory ResTotalModel.fromJson(Map<String, dynamic> json) {
    return ResTotalModel(
      json['rowCount'],
      json['totalmenu'],
      json['totalreserve'],
    );
  }
}
