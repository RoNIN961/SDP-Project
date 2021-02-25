class CusTotalModel {
  final rowCount;
  final totalrecipe;

  CusTotalModel(
    this.rowCount,
    this.totalrecipe,
  );
  factory CusTotalModel.fromJson(Map<String, dynamic> json) {
    return CusTotalModel(
      json['rowCount'],
      json['totalrecipe'],
    );
  }
}
