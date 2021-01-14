import 'navbar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Nav()));
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/catded.jpg'),
                        fit: BoxFit.cover)),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: Container(
                    alignment: Alignment(0.0, 2.5),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/statistics.jpg'),
                      radius: 60.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "User XXX",
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.blueGrey,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Super Admin",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.pink, Colors.redAccent]),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 100.0,
                          maxHeight: 40.0,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "See All Recipes",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.pink, Colors.redAccent]),
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 100.0,
                          maxHeight: 40.0,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
