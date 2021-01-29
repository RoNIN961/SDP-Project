import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login/loginBloc.dart';

import 'package:sdp_project/theme/custom.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    String usertype = BlocProvider.of<LoginBloc>(context).usertype;
    final logo =
        CustomLogo(onPressed: null, image: Image.asset('assets/logo2.png'));
    final inputEmail = CustomTextField(
      text: 'email address',
      controller: emailController,
    );
    final inputPassword = CustomHiddenTextField(
      text: 'password',
      controller: passwordController,
    );
    final buttonRegister = CustomButton2(
        onPressed: () {
          Navigator.pushNamed(context, '/register');
        },
        text: 'Not a member? Register here',
        color: Colors.red);
    final buttonLogin = CustomButton1(
      onPressed: () {
        loginBloc
            .add(FetchLoginData(emailController.text, passwordController.text));
        print(usertype);
      },
      text: 'login',
    );
    final buttonForgotPassword = CustomButton2(
      onPressed: () {},
      text: 'Forgot Password',
      color: Colors.grey,
    );
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            logo,
            SizedBox(
              height: 50,
            ),
            inputEmail,
            SizedBox(
              height: 30,
            ),
            inputPassword,
            SizedBox(
              height: 20,
            ),
            buttonRegister,
            SizedBox(
              height: 15,
            ),
            buttonLogin,
            buttonForgotPassword,
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoggedInSuccess) {
                  if (usertype == 'Customer') {
                    Navigator.pushNamed(context, '/home');
                  } else if (usertype == 'Restaurant') {
                    Navigator.pushNamed(context, '/restaurant_home');
                  } else {
                    Navigator.pushNamed(context, '/admin_home');
                  }
                }
                if (state is WrongCredentials) {
                  return Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Wrong Email or Password!'),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is NotLoggedIn) {
                  return SizedBox(
                    height: 30,
                  );
                }
                if (state is LoadingLogin) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is LoggedInFailed) {
                  return SnackBar(
                    content: Text(
                      'Please Try Again',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 30,
                      ),
                    ),
                    duration: Duration(seconds: 2),
                  );
                }
                return SizedBox(
                  height: 30,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
