class LoginModel {
  final username;
  final password;
  final email;

  LoginModel(this.username, this.password, this.email);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(json['Username'], json['Password'], json['Email']);
  }
}
