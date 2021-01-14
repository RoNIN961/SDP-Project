class LoginModel {
  final id;
  final email;
  final rowCount;
  final username;

  LoginModel(this.id, this.rowCount, this.email, this.username);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        json['User_ID'], json['rowCount'], json['Email'], json['Username']);
  }
}
