import 'package:flutter/material.dart';
import 'package:sdp_project/theme/custom.dart';

class HomeContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[CustomRecipeListView(), CustomRestaurantListView()],
    );
  }
}
