class LoginModel {
  final id;
  final rowCount;
  final email;
  final username;
  final usertype;

  LoginModel(this.id, this.rowCount, this.email, this.username, this.usertype);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(json['User_ID'], json['rowCount'], json['Email'],
        json['Username'], json['Usertype']);
  }
}
