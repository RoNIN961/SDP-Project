class LoginModel {
  final email;
  final password;
  final username;

  LoginModel(this.email, this.password, this.username);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(json['Username'], json['Password'], json['Email']);
  }
}
