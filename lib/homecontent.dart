import 'package:flutter/material.dart';
import 'recipe_detail.dart';

class HomeContentPage extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
    child: Column(
      children: [
        Card(
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Text('Recipe Name'),
              subtitle: Text('Author Name'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                 child: const Text('View'),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => RecipeScreen()));
              },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
      ],
    ),
    ),
  );
}
}