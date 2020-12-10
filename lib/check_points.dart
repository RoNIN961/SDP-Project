import 'package:flutter/material.dart';
import 'home.dart';

class CheckPointsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppBar(
      leading: BackButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        },
      ),
    );
  }
}
