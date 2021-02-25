import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'edit_profile(admin).dart';

class Userdata {
  final String username;
  String email;
  String id;
  String password;

  Userdata({
    this.username,
    this.email,
    this.id,
    this.password,
  });

  factory Userdata.fromJson(Map<String, dynamic> json) {
    return Userdata(
      username: json['Username'],
      email: json['Email'],
      id: json['User_ID'],
      password: json['Password'],
    );
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
            top: 32.0, bottom: 20.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              userListDisplay[index].username,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              userListDisplay[index].email,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  RaisedButton(
                      color: Colors.orange,
                      child: SizedBox(
                        width: 50,
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditUserProfilePage(userListDisplay[index]),
                          ),
                        );
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    color: Colors.orange,
                    onPressed: () {
                      var url =
                          'https://czechoslovakian-scr.000webhostapp.com/delete_user.php';
                      http.post(url, body: {'id': userListDisplay[index].id});
                      Navigator.pushNamed(context, '/admin_home');
                    },
                    child: SizedBox(
                      width: 50,
                      child: Text(
                        'Delete',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
