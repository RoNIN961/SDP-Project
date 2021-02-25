class InstructionModel {
  final rowCount;
  final recipeid;
  final step;
  final detail;

  InstructionModel(
    this.recipeid,
    this.rowCount,
    this.step,
    this.detail,
  );

  factory InstructionModel.fromJson(Map<String, dynamic> json) {
    return InstructionModel(
      json['recipeid'],
      json['rowCount'],
      json['step'],
      json['detail'],
    );
  }
}
