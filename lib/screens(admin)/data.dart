import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/admin/adminBloc.dart';
import '../bloc/admin/adminModel.dart';
import 'menu_chart.dart';
import 'menus.dart';
import 'recipe_chart.dart';
import 'recipes.dart';
import 'user_chart.dart';
import 'users.dart';

class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  List<AdminModel> data = [];

  @override
  Widget build(BuildContext context) {
    data = BlocProvider.of<AdminBloc>(context).result;

    final List<Users> userlist = [
      Users(
        user: "Admin",
        total: int.parse(data[0].totaladmin),
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      Users(
        user: "User",
        total: int.parse(data[0].totaluser),
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      Users(
        user: "Restaurant",
        total: int.parse(data[0].totalrestaurant),
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
    ];

    final List<Menus> menulist = [
      Menus(
        menu: "Main Dishes",
        total: int.parse(data[0].totalmaindish),
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      Menus(
        menu: "Snacks",
        total: int.parse(data[0].totalsnack),
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      Menus(
        menu: "Drink",
        total: int.parse(data[0].totaldrink),
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
    ];

    final List<Recipes> recipelist = [
      Recipes(
        recipe: "Halal",
        total: int.parse(data[0].totalhalal),
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      Recipes(
        recipe: "Non-Halal",
        total: int.parse(data[0].totalnonhalal),
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("Statistics"),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12, bottom: 12),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height - 280,
                      width: 390,
                      child: Card(
                        shadowColor: Colors.deepOrange,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Total Users',
                                style: GoogleFonts.inter(
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.deepOrange),
                              ),
                              Text('Total: ' + data[0].total,
                                  style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                              UsersChart(data: userlist)
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: MediaQuery.of(context).size.height - 280,
                width: 310,
                child: Card(
                  shadowColor: Colors.deepOrange,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Total Menus',
                          style: GoogleFonts.inter(
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                              color: Colors.deepOrange),
                        ),
                        Text('Total: ' + data[0].totalmenu,
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                        MenusChart(data: menulist)
                      ]),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: MediaQuery.of(context).size.height - 280,
                width: 310,
                child: Card(
                  shadowColor: Colors.deepOrange,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Total Recipes',
                          style: GoogleFonts.inter(
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                              color: Colors.deepOrange),
                        ),
                        Text('Total: ' + data[0].totalrecipe,
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                        RecipesChart(data: recipelist)
                      ]),
                ),
              ),
            )
          ],
        ));
  }
}
