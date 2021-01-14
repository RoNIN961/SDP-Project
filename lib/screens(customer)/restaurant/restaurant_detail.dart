import 'package:flutter/material.dart';
import 'package:sdp_project/screens(customer)/restaurant/book_reseravtion.dart';

class RestaurantContent extends StatefulWidget {
  @override
  _RestaurantContent createState() => _RestaurantContent();
}

class _RestaurantContent extends State<RestaurantContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          title: Text('My Flutter App'),
          actions: <Widget>[]),
      body: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Center(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                    radius: 50, backgroundImage: AssetImage("assets/KFC.png")),
                SizedBox(
                    height: 50,
                    child: Text('Restaurant Name',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ))),
                SizedBox(
                  height: 40,
                  child: Text(
                    'email',
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 350,
                  width: 400,
                  child: Card(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                        child: Text(
                          'MENU',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Image.asset(
                        'assets/KFC_menu.jpg',
                        height: 300,
                        width: 450,
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: RaisedButton(
              child: Text(
                'Make Reservation',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BookReservation()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
