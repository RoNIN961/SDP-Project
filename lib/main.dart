import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdp_project/bloc/restotal/restotalBloc.dart';
import 'package:sdp_project/bloc/restotal/restotalRepo.dart';

import 'bloc/admin/adminBloc.dart';
import 'bloc/admin/adminRepo.dart';
import 'bloc/custotal/custotalBloc.dart';
import 'bloc/custotal/custotalRepo.dart';
import 'bloc/homerecipe/homerecipeBloc.dart';
import 'bloc/homerecipe/homerecipeRepo.dart';
import 'bloc/homerestaurant/homerestaurantBloc.dart';
import 'bloc/homerestaurant/homerestaurantRepo.dart';
import 'bloc/ingredient/ingredientBloc.dart';
import 'bloc/ingredient/ingredientRepo.dart';
import 'bloc/instruction/instructionBloc.dart';
import 'bloc/instruction/instructionRepo.dart';
import 'bloc/login/loginBloc.dart';
import 'bloc/login/loginRepo.dart';
import 'bloc/menu/menuBloc.dart';
import 'bloc/menu/menuRepo.dart';
import 'bloc/recipe/recipeBloc.dart';
import 'bloc/recipe/recipeRepo.dart';
import 'bloc/reservations/reservationBloc.dart';
import 'bloc/reservations/reservationRepo.dart';
import 'bloc/restaurant/restaurantBloc.dart';
import 'bloc/restaurant/restaurantRepo.dart';
import 'bloc/review/reviewBloc.dart';
import 'bloc/review/reviewRepo.dart';
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
          ),
          BlocProvider(
            create: (context) => RestaurantBloc(
              RestaurantRepo(),
            ),
          ),
          BlocProvider(
            create: (context) => MenuBloc(
              MenuRepo(),
            ),
          ),
          BlocProvider(
            create: (context) => ReviewBloc(
              ReviewRepo(),
            ),
          ),
          BlocProvider(
            create: (context) => ReservationBloc(
              ReservationRepo(),
            ),
          ),
          BlocProvider(
            create: (context) => AdminBloc(
              AdminRepo(),
            ),
          ),
          BlocProvider(
            create: (context) => HomeRecipeBloc(
              HomeRecipeRepo(),
            ),
          ),
          BlocProvider(
            create: (context) => HomeRestaurantBloc(
              HomeRestaurantRepo(),
            ),
          ),
          BlocProvider(
            create: (context) => IngredientBloc(
              IngredientRepo(),
            ),
          ),
          BlocProvider(
            create: (context) => InstructionBloc(
              InstructionRepo(),
            ),
          ),
          BlocProvider(
            create: (context) => ResTotalBloc(
              ResTotalRepo(),
            ),
          ),
          BlocProvider(
            create: (context) => CusTotalBloc(
              CusTotalRepo(),
            ),
          ),
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
