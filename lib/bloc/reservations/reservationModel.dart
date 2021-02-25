class ReservationModel {
  final resid;
  final rowCount;
  final username;
  final time;
  final pax;
  final date;

  ReservationModel(
    this.resid,
    this.rowCount,
    this.username,
    this.time,
    this.pax,
    this.date,
  );

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      json['resid'],
      json['rowCount'],
      json['username'],
      json['time'],
      json['pax'],
      json['date'],
    );
  }
}
