import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[Menu()],
    );
  }
}
class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550.0,
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
                "Our Menu",
                style: TextStyle(color: Color(0xff616161), fontSize: 16.0),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.00, bottom: 15.00, left: 8, right: 4),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/chicken-casserole.jpg'),
                            width: 80.0,
                            height: 80.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                          ),
                          Text(
                            "Recipe Name",
                            style: TextStyle(
                              color: Color(0xff202124),                              
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                          ),
                          Text(
                            "Author name",
                            style: TextStyle(
                                color: Color(0xff5f6368), fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.00, bottom: 5.00, left: 8, right: 4),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/chicken-casserole.jpg'),
                            width: 80.0,
                            height: 80.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                          ),
                          Text(
                            "Recipe Name",
                            style: TextStyle(
                              color: Color(0xff202124),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                          ),
                          Text(
                            "Author name",
                            style: TextStyle(
                                color: Color(0xff5f6368), fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.00, bottom: 15.00, left: 8, right: 4),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/chicken-casserole.jpg'),
                            width: 80.0,
                            height: 80.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                          ),
                          Text(
                            "Recipe Name",
                            style: TextStyle(
                              color: Color(0xff202124),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                          ),
                          Text(
                            "Author name",
                            style: TextStyle(
                                color: Color(0xff5f6368), fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.00, bottom: 15.00, left: 8, right: 4),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/chicken-casserole.jpg'),
                            width: 80.0,
                            height: 80.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                          ),
                          Text(
                            "Recipe Name",
                            style: TextStyle(
                              color: Color(0xff202124),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                          ),
                          Text(
                            "Author name",
                            style: TextStyle(
                                color: Color(0xff5f6368), fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.00, bottom: 15.00, left: 8, right: 4),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/chicken-casserole.jpg'),
                            width: 80.0,
                            height: 80.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                          ),
                          Text(
                            "Recipe Name",
                            style: TextStyle(
                              color: Color(0xff202124),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                          ),
                          Text(
                            "Author name",
                            style: TextStyle(
                                color: Color(0xff5f6368), fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
                      
          ],
        )),
      ),      
    );
  }
}