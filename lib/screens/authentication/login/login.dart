import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdp_project/screens/restaurant/restaurantBloc.dart';
import 'loginBloc.dart';
import 'package:sdp_project/theme/custom.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    final restaurantBloc = BlocProvider.of<RestaurantBloc>(context);
    final logo = CustomLogo(onPressed: null, image: null);
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
        restaurantBloc.add(FetchRestaurantData('', '', ''));
        print(restaurantBloc.state);
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
            inputEmail,
            inputPassword,
            buttonRegister,
            buttonLogin,
            buttonForgotPassword,
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoggedInSuccess) {
                  return Navigator.pushNamed(context, '/home');
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
                  return SizedBox(
                    child: Text('Something went wrong'),
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
