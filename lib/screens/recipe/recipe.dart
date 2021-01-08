import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
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
                  ListTile(
                    leading: ConstrainedBox(
                        constraints:
                            BoxConstraints(maxWidth: 80.0, maxHeight: 20.0),
                        child: Image.asset('assets/ginger-chicken.jpg')),
                    title: Text('Recipe Name'),
                    subtitle: Text('Author Name'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('View'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/recipe_detail');
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
