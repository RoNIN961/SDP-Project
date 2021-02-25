import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../authentication/login.dart';
import '../bloc/login/loginBloc.dart';
import 'home(admin).dart';
import 'listview.dart';
import 'profile(admin).dart';

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
    String username = BlocProvider.of<LoginBloc>(context).name;
    String useremail = BlocProvider.of<LoginBloc>(context).email;
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
                accountName: Text(username),
                accountEmail: Text(useremail),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/personicon.jpg'),
                )),
            new ListTile(
              title: new Text("View Account"),
              trailing: new Icon(Icons.people),
              onTap: () {
                BlocProvider.of<LoginBloc>(context)
                    .add(FetchLoginData(username, useremail));
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
