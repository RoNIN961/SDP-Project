import 'package:flutter/material.dart';

class ReservationDetailScreen extends StatelessWidget{
  final reservationlist;

  ReservationDetailScreen(this.reservationlist);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                height:MediaQuery.of(context).size.height/ 3 + 20,
                width:MediaQuery.of(context).size.width,
                child:Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset(
                      'assets/Reservation.jpg',
                      fit:BoxFit.fill,                      
                    ),
                    Positioned(
                      top:40,
                      left:20,
                      child:IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      }
                      ),
                    ),
                    Positioned(
                      top:MediaQuery.of(context).size.height/ 3 - 20,
                      child:Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50), 
                            ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal:30),
                          child:Column(
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'UserName',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 3 - 120,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal:30),
                        child: Row(
                          children: <Widget>[
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
                                        scale: 9,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]
                        ),
                      ),
                    ), 
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
