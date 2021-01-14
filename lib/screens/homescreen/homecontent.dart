import 'package:flutter/material.dart';
import 'package:sdp_project/theme/custom.dart';

class HomeContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(boxShadow: [
        new BoxShadow(
          color: Color(0xffeeeeee),
          blurRadius: 1.0,
          offset: new Offset(1.0, 1.0),
        ),
      ]),
      child: Card(
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child: Text(
                  "Welcome to FoodAmore",
                  style: TextStyle(color: Color(0xff616161), fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 3.0),
                child: Text(
                  "Browse our most popular recipes",
                  style: TextStyle(color: Color(0xff616161), fontSize: 12.0),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CustomRecipeListView();
                },
              )),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child: Text(
                  "New & Updated Restaurants",
                  style: TextStyle(color: Color(0xff616161), fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 3.0),
                child: Text(
                  "Selected Restaurants For You",
                  style: TextStyle(color: Color(0xff616161), fontSize: 12.0),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CustomRestaurantListView();
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
