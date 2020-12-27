import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

gettheme() {
  return {ThemeData(primarySwatch: Colors.deepOrange)};
}

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
  CustomTextField({@required this.onPressed, this.text});
  final GestureTapCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: TextField(
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
  CustomHiddenTextField({@required this.onPressed, this.text});
  final GestureTapCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: TextField(
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
          accountEmail: Text(""),
          accountName: Text(""),
          currentAccountPicture: Image.asset(''),
        ),
        ListTile(
          leading: IconTheme(
            data: _iconcolor,
            child: Icon(Icons.apps),
          ),
          title: Text("My recipes", style: _menutextcolor),
          selected: true,
          onTap: () {},
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
          onTap: () {},
        ),
        ListTile(
          leading: IconTheme(
            data: _iconcolor,
            child: Icon(Icons.settings),
          ),
          title: Text("Settings", style: _menutextcolor),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text("Redeem", style: _menutextcolor),
          onTap: () {},
        ),
      ],
    );
  }
}
