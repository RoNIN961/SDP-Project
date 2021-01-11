import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdp_project/loginBloc.dart';
import 'package:sdp_project/loginRepo.dart';
import '../../theme/custom.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(context) {
    return BlocProvider(
      create: (context) => LoginBloc(LoginRepo()),
      child: LoginUI(),
    );
  }
}

class LoginUI extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    final logo = CustomLogo(
        onPressed: null, image: Image.asset('assets/login_logo.png'));
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
      onPressed: () => loginBloc.add(FetchLoginData(emailController.text)),
      text: 'login',
    );
    final buttonForgotPassword = CustomButton2(
      onPressed: null,
      text: 'Forgot Password',
      color: Colors.grey,
    );
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            logo,
            inputEmail,
            inputPassword,
            buttonRegister,
            buttonLogin,
            buttonForgotPassword,
            BlocConsumer<LoginBloc, LoginState>(builder: (context, state) {
              if (State is NotLoggedIn)
                return LoginUI();
              else if (State is LoadingLogin)
                return Center(child: CircularProgressIndicator());

              return Text("error");
            }, listener: (context, state) {
              if (State is LoggedInSuccess)
                Navigator.pushNamed(context, '/Home');
            })
          ],
        ),
      ),
    ));
  }
}
