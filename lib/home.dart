import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'detail.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool searching = false;
  Future<List<User>> _getUsers() async {
    var url = 'https://czechoslovakian-scr.000webhostapp.com/login.php';

    var data = await http.post(url);

    var jsonData = json.decode(data.body);

    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u["Username"], u["Usertype"], u["Email"]);

      users.add(user);
    }

    print(users.length);

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: !searching
            ? Image(
                image: AssetImage('assets/logo2.png'),
                fit: BoxFit.cover,
                height: 100.0)
            : TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.white),
                    hintText: "Search name here",
                    hintStyle: TextStyle(color: Colors.white)),
              ),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          searching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.searching = false;
                    });
                  })
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.searching = true;
                    });
                  })
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(snapshot.data[index].email),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(snapshot.data[index])));
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
