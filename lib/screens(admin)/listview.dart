import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Userdata {
  String username;
  String email;
  String usertype;

  Userdata(
    u, {
    this.username,
    this.email,
    this.usertype,
  });

  factory Userdata.fromJson(Map<String, dynamic> json) {
    return Userdata({
      json['Username'],
      json['Email'],
      json['Usertype'],
    });
  }
}

class UserListPage extends StatefulWidget {
  @override
  UserListPageState createState() => UserListPageState();
}

class UserListPageState extends State<UserListPage> {
  List<Userdata> userList = List<Userdata>();
  List<Userdata> userListDisplay = List<Userdata>();

  Future<List<Userdata>> fetchUsers() async {
    var url = 'https://czechoslovakian-scr.000webhostapp.com/adminListView.php';
    var response = await http.get(url);

    var users = List<Userdata>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        users.add(Userdata.fromJson(noteJson));
      }
    }
    return users;
  }

  @override
  void initState() {
    fetchUsers().then((value) {
      setState(() {
        userList.addAll(value);
        userListDisplay = userList;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'All Users',
            style: TextStyle(color: Colors.deepOrange),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return index == 0 ? _searchBar() : _listItem(index - 1);
          },
          itemCount: userListDisplay.length + 1,
        ));
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(hintText: 'Search...'),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            userListDisplay = userList.where((user) {
              var un = user.username.toLowerCase();
              return un.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              // userListDisplay[index].username,
              'user',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              // userListDisplay[index].email,
              'email',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
