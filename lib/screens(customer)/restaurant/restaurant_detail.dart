import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/menu/menuBloc.dart';
import '../../bloc/menu/menuModel.dart';
import '../../theme/custom.dart';
import 'book_reservation.dart';
import 'customer_review.dart';

class RestaurantContent extends StatelessWidget {
  final resdata;
  RestaurantContent(this.resdata);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            BlocProvider.of<MenuBloc>(context).add(
              ResetMenuData(),
            );
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Center(
            child: Column(
              children: [
                SizedBox(height: 10),
                CircleAvatar(
                  radius: 80,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl:
                        'https://czechoslovakian-scr.000webhostapp.com/uploads(Profile)/${resdata.image}',
                    placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                    fadeOutDuration: new Duration(seconds: 1),
                    fadeInDuration: new Duration(seconds: 3),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: Text(
                    resdata.resname,
                    style: GoogleFonts.inter(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 100,
                      child: Text(
                        "Contact:",
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Text(
                        resdata.contact,
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 30),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 80,
                      child: Text(
                        "Email:",
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Text(
                        resdata.email,
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 30),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 100,
                      child: Text(
                        "Address:",
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Text(
                        resdata.address,
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 30),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.orange),
                  child: Center(
                    child: Text(
                      'MENU',
                      style: GoogleFonts.inter(
                          fontSize: 40, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<MenuBloc, MenuState>(
            builder: (context, state) {
              if (state is LoadingMenu) {
                return LinearProgressIndicator();
              }
              if (state is MenuLoaded) {
                return RestaurantMenu(resdata);
              }
              if (state is MenuFailedLoad) {
                return RestaurantMenu(resdata);
              }
              return RestaurantContent(resdata);
            },
          ),
        ],
      ),
    );
  }
}

class RestaurantMenu extends StatelessWidget {
  final resdata;
  RestaurantMenu(this.resdata);

  @override
  Widget build(BuildContext context) {
    List<MenuModel> menudata = BlocProvider.of<MenuBloc>(context).result;

    return Container(
      height: 450,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 350,
                  width: 400,
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                            child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Menulist(menudata[index]);
                          },
                          itemCount: menudata == null ? 0 : menudata.length,
                          shrinkWrap: true,
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 240,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: CustomButton1(
                  text: 'Make Reservation',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BookReservation(resdata),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Menulist extends StatelessWidget {
  final menu;
  Menulist(this.menu);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 150,
                child: Text(menu.menuname,
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                width: 80,
              ),
              SizedBox(
                width: 100,
                child: Text(
                  'RM  ${menu.price}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CustomerReview(menu),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
