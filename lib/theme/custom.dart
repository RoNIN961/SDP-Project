import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CustomLogo extends StatelessWidget {
  CustomLogo({@required this.onPressed, this.image});
  final GestureTapCallback onPressed;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Hero(
              tag: 'hero', child: CircleAvatar(radius: 56.0, child: image))),
      onPressed: onPressed,
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({@required this.onPressed, this.text, this.controller});
  final GestureTapCallback onPressed;
  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: text,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0))),
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class CustomHiddenTextField extends StatelessWidget {
  CustomHiddenTextField({@required this.onPressed, this.text, this.controller});
  final GestureTapCallback onPressed;
  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
              hintText: text,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0))),
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class CustomButton1 extends StatelessWidget {
  CustomButton1({@required this.onPressed, this.text});
  final GestureTapCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: ButtonTheme(
          height: 56,
          child: RaisedButton(
            child:
                Text(text, style: TextStyle(color: Colors.white, fontSize: 20)),
            color: Colors.black87,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: onPressed,
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class CustomButton2 extends StatelessWidget {
  CustomButton2({@required this.onPressed, this.text, this.color});
  final GestureTapCallback onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: FlatButton(
          child: Text(
            text,
            style: TextStyle(color: color, fontSize: 16),
          ),
          onPressed: onPressed),
      onPressed: onPressed,
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final _menutextcolor = TextStyle(
    color: Colors.black,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );
  final _iconcolor = new IconThemeData(
    color: Color(0xff757575),
  );
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: Text("rong090601@gmail.com"),
          accountName: Text("RoNIN01"),
          currentAccountPicture: Image.asset(''),
        ),
        ListTile(
          leading: IconTheme(
            data: _iconcolor,
            child: Icon(Icons.list),
          ),
          title: Text("My recipes", style: _menutextcolor),
          selected: true,
          onTap: () {
            Navigator.pushNamed(context, '/user_recipes');
          },
        ),
        ListTile(
          leading: IconTheme(
            data: _iconcolor,
            child: Icon(Icons.notifications),
          ),
          title: Text("Notification", style: _menutextcolor),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: IconTheme(
            data: _iconcolor,
            child: Icon(Icons.account_box),
          ),
          title: Text("Account", style: _menutextcolor),
          onTap: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
        ListTile(
          leading: IconTheme(
            data: _iconcolor,
            child: Icon(Icons.settings),
          ),
          title: Text("Settings", style: _menutextcolor),
          onTap: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
        Divider(),
        ListTile(
          title: Text("Redeem", style: _menutextcolor),
          onTap: () {
            Navigator.pushNamed(context, '/check_points');
          },
        ),
      ],
    );
  }
}

class CustomRecipeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.00, bottom: 15.00, left: 8, right: 4),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image(
                            image: AssetImage(''),
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
                            image: AssetImage(''),
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
                            image: AssetImage(''),
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
                            image: AssetImage(''),
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
                            image: AssetImage(''),
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

class CustomRestaurantListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.00, bottom: 15.00, left: 8, right: 4),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image(
                            image: AssetImage(''),
                            width: 80.0,
                            height: 80.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                          ),
                          Text(
                            "Restaurant Name",
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
                            image: AssetImage(''),
                            width: 80.0,
                            height: 80.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                          ),
                          Text(
                            "Restaurant Name",
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
                            image: AssetImage(''),
                            width: 80.0,
                            height: 80.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                          ),
                          Text(
                            "Restaurant Name",
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
                            image: AssetImage(''),
                            width: 80.0,
                            height: 80.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                          ),
                          Text(
                            "Restaurant Name",
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
                            image: AssetImage(''),
                            width: 80.0,
                            height: 80.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                          ),
                          Text(
                            "Restaurant Name",
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
