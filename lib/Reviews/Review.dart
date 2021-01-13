import 'package:flutter/material.dart';
import 'package:sdp_project/Reviews/Review_details.dart';

const ReviewListData = [
  {
    'Cus_Name': 'Happy Meals',
    'total_review': '100',
    'Email': 'luiyande5678@gmail.com',
    'imgUrl': 'assets/chicken-fajitas.jpg',
    'total_rating': '4.6',
  },
  {
    'Cus_Name': 'Happy Meals',
    'total_review': '90',
    'Email': 'mirz666a@gmail.com',
    'imgUrl': 'assets/Happy Meals.jpg',
    'total_rating': '4.7',
  },
  {
    'Cus_Name': 'Happy Meals',
    'total_review': '70',
    'Email': 'lim222@gmail.com',
    'imgUrl': 'assets/Yukinoshita Yukino.jpg',
    'total_rating': '4.5',
  },
];

class ReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[Review()],
    );
  }
}

class Review extends StatelessWidget {
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
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                'Review',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              MenuReview(ReviewListData[0]),
              MenuReview(ReviewListData[1]),
              MenuReview(ReviewListData[2]),
          ],
        )
      ),
    );
  }
}

class MenuReview extends StatelessWidget {
  final reviewlist;
  MenuReview(this.reviewlist);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4 - 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFECEFF1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 10,
            left: 10,
            child: Image.asset(
              reviewlist['imgUrl'],
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  reviewlist['Cus_Name'],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10
                ),
                Text(
                  '${reviewlist['total_review']} total reviews',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children:<Widget>[
                    Icon(
                      Icons.star,
                      size:16,
                      color:Color(0xffFF8573),
                    ),
                    SizedBox(width:5),
                    Text(
                      reviewlist['total_rating'],
                      style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(width:26),
                    MaterialButton(
                      onPressed: () {
                    Navigator.push(
                      context,
                    MaterialPageRoute(
                      builder: (context) => ReviewDetailScreen(reviewlist)
                      )
                    );
                  },
                    color: Color(0xff4E2958),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'View Review',
                      style: TextStyle(
                        color: Colors.white,
                          ),
                        )
                      ),
                  ],
                ),
              ],
            ),
          )
        ]
      )
    );
  }
}
