import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdp_project/screens/restaurant/restaurantBloc.dart';
import 'package:sdp_project/screens/restaurant/restaurantRepo.dart';
import 'package:sdp_project/theme/route.dart';
import 'screens/authentication/login/loginBloc.dart';
import 'screens/authentication/login/loginRepo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(
              LoginRepo(),
            ),
          ),
          BlocProvider<RestaurantBloc>(
            create: (context) => RestaurantBloc(
              RestaurantRepo(),
            ),
          )
        ],
        child: MaterialApp(
          title: 'FoodAmore',
          initialRoute: '/',
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          routes: getroute(),
        ));
  }
}
