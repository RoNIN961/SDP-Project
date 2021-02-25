class ReviewModel {
  final reviewid;
  final feedback;
  final rowCount;
  final menuid;

  final username;
  final rating;

  ReviewModel(
    this.reviewid,
    this.feedback,
    this.rowCount,
    this.menuid,
    this.username,
    this.rating,
  );

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      json['reviewid'],
      json['feedback'],
      json['rowCount'],
      json['menuid'],
      json['username'],
      json['rating'],
    );
  }
}
