import 'package:flutter/material.dart';
import 'package:sdp_project/theme/custom.dart';

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [CustomRecipePageCard()],
        ),
      ),
    );
  }
}
