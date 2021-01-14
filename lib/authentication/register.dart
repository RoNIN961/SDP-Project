import 'package:flutter/material.dart';
import 'package:sdp_project/theme/custom.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  Future addData() async {
    try {
      String username = usernameController.text;
      String email = emailController.text;
      String password = passwordController.text;

      var url = 'https://czechoslovakian-scr.000webhostapp.com/register.php';

      var data = {
        'Username': username,
        'Password': password,
        'Email': email,
        'Usertype': 'Customer'
      };

      var response = await http.post(url, body: data);

      var message = response.body;

      print(message);
      //var jsonResponse = jsonDecode(response.body);

      if (message == 'Registration Success!') {
        Navigator.pushNamed(context, '/');
      } else {
        // Showing Alert Dialog with Response JSON Message.
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text(message),
              actions: <Widget>[
                FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final inputUsername =
        CustomTextField(text: 'Username', controller: usernameController);
    final inputEmail = CustomTextField(
      text: 'email address',
      controller: emailController,
    );
    final inputPassword = CustomHiddenTextField(
      text: 'password',
      controller: passwordController,
    );
    final buttonRegister =
        CustomButton1(onPressed: addData, text: 'Create Account');
    final buttonLogin = CustomButton2(
      onPressed: () {
        Navigator.pushNamed(context, '/');
      },
      text: 'Already have an account? Login Here',
    );
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            inputUsername,
            inputEmail,
            inputPassword,
            buttonRegister,
            buttonLogin
          ],
        ),
      ),
    ));
  }
}
