import 'package:flutter/material.dart';
import 'main.dart';

class VoucherHistory extends StatelessWidget {
  final User user;

  VoucherHistory(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Container(
          decoration: BoxDecoration(color: Colors.deepOrange),
          child: Container(
            width: double.infinity,
            height: 200.0,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Voucher history',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          )),
      Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[],
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      Container(
        width: 300.00,
      )
    ]));
  }
}
