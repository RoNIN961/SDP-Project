import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sdp_project/bloc/restaurant/restaurantBloc.dart';
import 'package:sdp_project/bloc/restotal/restotalBloc.dart';
import 'package:sdp_project/bloc/restotal/restotalModel.dart';
import 'package:sdp_project/screens(restaurant)/home/restaurant_home.dart';

class RestaurantHomeContent extends StatefulWidget {
  @override
  _RestaurantHomeContentState createState() => _RestaurantHomeContentState();
}

class _RestaurantHomeContentState extends State<RestaurantHomeContent> {
  List<ResTotalModel> data = [];

  @override
  void initState() {
    String resid = BlocProvider.of<RestaurantBloc>(context).resid;
    BlocProvider.of<ResTotalBloc>(context).add(
      FetchResTotalData(resid),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = BlocProvider.of<ResTotalBloc>(context).result;

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text('Home',
                    style: GoogleFonts.inter(
                        fontSize: 30, fontWeight: FontWeight.w500)),
              ),
            ),
          ),
          BlocBuilder<ResTotalBloc, ResTotalState>(
            builder: (context, state) {
              if (state is LoadingResTotal) {
                return LinearProgressIndicator();
              }
              if (state is ResTotalLoaded) {
                return CustomRecipeListView();
              }
              if (state is ResTotalFailedLoad) {
                return RestaurantHomeContent();
              }
              return RestaurantHome();
            },
          ),
        ],
      ),
    );
  }
}

class CustomRecipeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ResTotalModel> data = BlocProvider.of<ResTotalBloc>(context).result;

    return Column(
      children: [
        Container(
            height: 200.0,
            width: 400,
            decoration: new BoxDecoration(boxShadow: [
              new BoxShadow(
                color: Color(0xffeeeeee),
                blurRadius: 1.0,
                offset: new Offset(1.0, 1.0),
              ),
            ]),
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 200,
                width: 310,
                child: Card(
                  shadowColor: Colors.deepOrange,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Icon(
                          Icons.menu_book,
                          size: 80,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Menus Uploaded',
                              style: GoogleFonts.inter(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.deepOrange),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Total: ${data[0].totalmenu}',
                                style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ]),
                    ],
                  ),
                ),
              ),
            )),
        Container(
            height: 200.0,
            width: 400,
            decoration: new BoxDecoration(boxShadow: [
              new BoxShadow(
                color: Color(0xffeeeeee),
                blurRadius: 1.0,
                offset: new Offset(1.0, 1.0),
              ),
            ]),
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 200,
                width: 310,
                child: Card(
                  shadowColor: Colors.deepOrange,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Icon(
                          Icons.book,
                          size: 80,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Total Reservations',
                              style: GoogleFonts.inter(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.deepOrange),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Total: ${data[0].totalreserve}',
                                style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ]),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
