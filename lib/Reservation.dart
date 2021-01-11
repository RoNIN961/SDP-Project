import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Reservation_detail.dart';

const Re_ListData = [
  {
    'Cus_Name' : 'Lui Yan De',
    'Reservation_Date' : '8/1/2021',
    'Email' : 'luiyande5678@gmail.com',
    'imgUrl': 'assets/Yukinoshita Yukino.jpg',
    'bgColor': Color(0xFFEFEFEF),
  },
  {
    'Cus_Name' : 'Mirza',
    'Reservation_Date' : '9/1/2021',
    'Email' : 'mirz666a@gmail.com',
    'imgUrl': 'assets/Yukinoshita Yukino.jpg',
    'bgColor': Color(0xFFC8E6C9),
  },
  {
    'Cus_Name' : 'Lim Jia Rong',
    'Reservation_Date' : '10/1/2021',
    'Email' : 'lim222@gmail.com',
    'imgUrl': 'assets/Yukinoshita Yukino.jpg',
    'bgColor': Color(0xFFA5D6A7),
  },
];

class ReservationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[Reservation()],
    );
  }
}
class Reservation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),
        ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height:20,
                ),
              Text(
                'Reservation',
                style: TextStyle(
                  fontWeight:FontWeight.bold, 
                  fontSize: 24
                  ),
                  ),
                  ReservationListCard(Re_ListData[0]),
                  ReservationListCard(Re_ListData[1]),
                  ReservationListCard(Re_ListData[2]),
            ],
          )
        ),
      );
  }
}

class ReservationListCard extends StatelessWidget {
  final reservationlist;
  ReservationListCard(this.reservationlist);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(vertical:20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4-20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color : reservationlist['bgColor'],        
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top:10,
            right:10,
            child:Image.asset(
              reservationlist['imgUrl'], 
            height:MediaQuery.of(context).size.height * 0.20,
            width:MediaQuery.of(context).size.width * 0.30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:20,left:30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  reservationlist['Cus_Name'],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,                    
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height:5,
                ),
                Text(
                  reservationlist['Reservation_Date'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,  
                    ),
                ),
                SizedBox(
                  height:10,
                ),
                MaterialButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => ReservationDetailScreen(reservationlist)));
                  },
                  color: Color(0xff4E2958),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(
                      'View Profile',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                    ),
              ],
            ),
          )
        ],
      ),
    );
  }

}