import 'package:flutter/material.dart';

var reviewdetail = [
  {
    'User': 'Lui Yan De',
    'imgUrl': 'assets/Yukinoshita Yukino.jpg',
    'feedback': 'Good!',
    'rating': 4.6
  },
  {
    'User': 'Lui Yan Ying',
    'imgUrl': 'assets/Yukinoshita Yukino.jpg',
    'feedback': 'Great!',
    'rating': 4.6
  },
  {
    'User': 'Lui Yan Xiu',
    'imgUrl': 'assets/Yukinoshita Yukino.jpg',
    'feedback': 'Perfect!',
    'rating': 4.6
  },
  {
    'User': 'Lui Yan Jing',
    'imgUrl': 'assets/Yukinoshita Yukino.jpg',
    'feedback': 'Perfect!',
    'rating': 4.6
  },
];

class ReviewDetailScreen extends StatelessWidget {
  final reviewlist;
  ReviewDetailScreen(this.reviewlist);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height / 3 + 20,
                width: MediaQuery.of(context).size.width,
                child: Stack(fit: StackFit.expand, children: <Widget>[
                  Image.asset(
                    reviewlist['imgUrl'],
                    fit: BoxFit.fill,
                  )
                ])),
            Positioned(
              top: 5,
              left: 10,
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.deepOrange),
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
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 20),
                            Text(
                              'Review',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            UserReview(reviewdetail[0]),
                            UserReview(reviewdetail[1]),
                            UserReview(reviewdetail[2]),
                            UserReview(reviewdetail[3])
                          ]))),
            ),
          ],
        ),
      ),
    ));
  }
}

class UserReview extends StatelessWidget {
  final review;
  UserReview(this.review);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 6 - 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            )
          ],
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 10,
              child: Image.asset(
                review['imgUrl'],
                height: MediaQuery.of(context).size.height * 0.125,
                width: MediaQuery.of(context).size.width * 0.2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    review['User'],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Row(children: <Widget>[
                    SizedBox(
                      width: 160,
                    ),
                    Icon(
                      Icons.star,
                      size: 25,
                      color: Color(0xffFF8573),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '${review['rating']}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ]),
                  Text(
                    review['feedback'],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
