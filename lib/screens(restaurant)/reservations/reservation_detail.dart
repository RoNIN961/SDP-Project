import 'package:flutter/material.dart';

class ReservationDetailScreen extends StatelessWidget {
  final reservationlist;

  ReservationDetailScreen(this.reservationlist);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height / 3 + 20,
                width: MediaQuery.of(context).size.width,
                child: Stack(fit: StackFit.expand, children: <Widget>[
                  Image.asset(
                    'assets/Reservation.jpg',
                    fit: BoxFit.fill,
                  )
                ])),
            Positioned(
              top: 25,
              left: 10,
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.deepOrange,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height / 3 - 30,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 80),
                            Center(
                                child: Column(children: <Widget>[
                              SizedBox(
                                child: Text(
                                  'Username',
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Text(
                                reservationlist['Cus_Name'],
                                style: TextStyle(
                                    fontSize: 28, color: Color(0xFFB0BEC5)),
                              ),
                              SizedBox(height: 50),
                              Text(
                                'Email',
                                style: TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 30),
                              Text(
                                reservationlist['Email'],
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xFF2196F3)),
                              )
                            ]))
                          ]),
                    ))),
            Positioned(
              top: MediaQuery.of(context).size.height / 3 - 120,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 20,
                    height: MediaQuery.of(context).size.height / 6 + 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Positioned(
                          top: 20,
                          left: 0,
                          child: Image.asset(
                            reservationlist['imgUrl'],
                            fit: BoxFit.fill,
                            scale: 6,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
