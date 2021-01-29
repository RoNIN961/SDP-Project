import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdp_project/bloc/recipe/recipeBloc.dart';
import 'bloc/login/loginBloc.dart';
import 'bloc/login/loginRepo.dart';
import 'bloc/recipe/recipeRepo.dart';
import 'theme/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginBloc(
              LoginRepo(),
            ),
          ),
          BlocProvider(
            create: (context) => RecipeBloc(
              RecipeRepo(),
            ),
          )
        ],
        child: MaterialApp(
          title: 'Project FoodAmore',
          initialRoute: '/',
          routes: getroute(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
          ),
        ));
  }
}
