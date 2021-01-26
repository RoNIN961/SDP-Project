import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sdp_project/screens(customer)/restaurant/book_reseravtion.dart';
import 'package:http/http.dart' as http;

class RestaurantContent extends StatefulWidget {
  @override
  _RestaurantContent createState() => _RestaurantContent();
}

class _RestaurantContent extends State<RestaurantContent> {
  List data;

  Future<String> getJSONData() async {
    var response = await http.get(
      // Encode the url
      Uri.encodeFull(
          "https://czechoslovakian-scr.000webhostapp.com/restaurantprofile.php"),
      // Only accept JSON response
      headers: {"Accept": "application/json"},
    );

    setState(() {
      // Get the JSON data
      data = jsonDecode(response.body);
    });

    return "Successfull";
  }

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
                    child: Text('$data',
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
