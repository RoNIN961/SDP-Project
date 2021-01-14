import 'home(admin).dart';
import 'listview.dart';
import 'package:sdp_project/authentication/login/login.dart';
import 'profile(admin).dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetop = <Widget>[
    Home(),
    UserListPage(),
  ];
  void _onitemtap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title: Center(
              child: Image(
                image: AssetImage('assets/logo2.png'),
                fit: BoxFit.cover,
                height: 93,
              ),
            )),
        drawer: new Drawer(
          child: new ListView(children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text('nibbas'),
                accountEmail: new Text('bababoey@mail.com'),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/statistics.jpg'),
                )),
            new ListTile(
              title: new Text("View Account"),
              trailing: new Icon(Icons.people),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            new ListTile(
              title: new Text("Logout"),
              trailing: new Icon(Icons.logout),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            )
          ]),
        ),
        body: Center(
          child: _widgetop.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "Profiles",
            )
          ],
          currentIndex: _selectedIndex,
          onTap: _onitemtap,
        ));
  }
}
