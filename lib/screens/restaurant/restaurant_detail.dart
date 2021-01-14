import 'package:flutter/material.dart';

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
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                    width: 400.0,
                    height: 200.0,
                    child: Image.asset('assets/MCD.png')),
                SizedBox(
                  width: 400.0,
                  height: 200.0,
                  child: ListView(
                    children: <Widget>[
                      Center(
                        child: Text(
                          'McDonalds',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 30.0,
                          ),
                          SizedBox(
                            height: 30.0,
                            child: Row(
                              children: [
                                SizedBox(
                                  child: Text(
                                    'email: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                    child: Text('mcdonalds@mail.com',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 20)))
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
