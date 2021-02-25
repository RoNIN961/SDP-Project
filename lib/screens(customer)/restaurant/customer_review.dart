import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

import '../../bloc/login/loginBloc.dart';
import '../../theme/custom.dart';

class CustomerReview extends StatefulWidget {
  final menudata;
  CustomerReview(this.menudata);

  @override
  _CustomerReviewState createState() => _CustomerReviewState(menudata);
}

class _CustomerReviewState extends State<CustomerReview> {
  final _ratingController = TextEditingController();
  final _feedbackController = TextEditingController();
  double _userRating = 3.0;
  bool _isVertical = false;
  IconData _selectedIcon;

  final menudata;
  _CustomerReviewState(this.menudata);

  @override
  void initState() {
    _ratingController.text = '3.0';
    super.initState();
  }

  Future addReview() async {
    try {
      String rating = _ratingController.text;
      String userid = BlocProvider.of<LoginBloc>(context).userid;
      String feedback = _feedbackController.text;
      String menuid = menudata.menuid;
      String resid = menudata.resid;

      var url = 'https://czechoslovakian-scr.000webhostapp.com/add_review.php';

      var data = {
        'Feedback': feedback,
        'Rating': rating,
        'Menu_ID': menuid,
        'User_ID': userid,
        'Restaurant_ID': resid,
      };

      var response = await http.post(url, body: data);

      var message = response.body;

      if (message == 'Review Added Successfully!') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text('Added Review'),
              actions: <Widget>[
                FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Showing Alert Dialog with Response JSON Message.
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text(message),
              actions: <Widget>[
                FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.chevron_left),
              iconSize: 40.0,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.amberAccent),
                height: 200,
                width: 300,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl:
                      'https://czechoslovakian-scr.000webhostapp.com/uploads(Menu)/${menudata.image}',
                  placeholder: (context, url) =>
                      new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                  fadeOutDuration: new Duration(seconds: 1),
                  fadeInDuration: new Duration(seconds: 3),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              _heading(menudata.menuname),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Column(
          children: [
            Container(
              child: Text(
                'Leave us a Review',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
              ),
            ),
            RatingBarIndicator(
              rating: _userRating,
              itemBuilder: (context, index) => Icon(
                _selectedIcon ?? Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 50.0,
              unratedColor: Colors.amber.withAlpha(50),
              direction: _isVertical ? Axis.vertical : Axis.horizontal,
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            controller: _ratingController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter rating',
              labelText: 'Enter rating',
              suffixIcon: MaterialButton(
                onPressed: () {
                  setState(() {
                    _userRating = double.parse(_ratingController.text ?? '0.0');
                  });
                },
                child: Text('Rate'),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            controller: _feedbackController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter feedback',
              labelText: 'Enter Feedback',
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        CustomButton1(
          onPressed: () {
            addReview();
          },
          text: 'Submit Feedback',
        )
      ]),
    );
  }

  Widget _heading(String text) => Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 35.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      );
}
