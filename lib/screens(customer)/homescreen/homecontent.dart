import 'package:flutter/material.dart';
import 'package:sdp_project/theme/listviews.dart';

class HomeContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2 - 80,
            child: CustomRecipeListView()),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child: CustomRestaurantListView())
      ],
    );
  }
}
