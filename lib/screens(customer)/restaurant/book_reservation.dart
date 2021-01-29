import 'package:flutter/material.dart';
import 'package:sdp_project/theme/custom.dart';

class BookReservation extends StatefulWidget {
  @override
  _BookReservationState createState() => _BookReservationState();
}

class _BookReservationState extends State<BookReservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(child: Image.asset('assets/KFC.png')),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                title: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Text(
                    'Booking Date & Time',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                title: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      Text(
                        'Total pax',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 300,
                      ),
                      PaxDropDownButton()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
