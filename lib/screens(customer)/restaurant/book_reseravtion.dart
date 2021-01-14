import 'package:flutter/material.dart';

class BookReservation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
                trailing: RaisedButton(
                  onPressed: () {
                    print('object');
                  },
                  textColor: Colors.white,
                  elevation: 1,
                  child: Text('Book Now'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
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
