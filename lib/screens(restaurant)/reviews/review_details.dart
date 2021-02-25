import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sdp_project/bloc/menu/menuBloc.dart';
import 'package:sdp_project/bloc/restaurant/restaurantBloc.dart';

import '../../bloc/review/reviewBloc.dart';
import '../../bloc/review/reviewModel.dart';
import '../home/restaurant_home.dart';

class ReviewDetailScreen extends StatefulWidget {
  final reviewlist;
  ReviewDetailScreen(this.reviewlist);

  @override
  _ReviewDetailScreenState createState() =>
      _ReviewDetailScreenState(reviewlist);
}

class _ReviewDetailScreenState extends State<ReviewDetailScreen> {
  List<ReviewModel> data = [];
  final reviewlist;

  _ReviewDetailScreenState(this.reviewlist);
  @override
  Widget build(BuildContext context) {
    data = BlocProvider.of<ReviewBloc>(context).result;

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
                    CachedNetworkImage(
                      imageUrl:
                          'https://czechoslovakian-scr.000webhostapp.com/uploads(Menu)/${reviewlist.image}',
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.30,
                      fit: BoxFit.fill,
                    ),
                  ])),
              Positioned(
                top: 5,
                left: 10,
                child: IconButton(
                    iconSize: 30,
                    icon: Icon(Icons.arrow_back_ios, color: Colors.deepOrange),
                    onPressed: () {
                      BlocProvider.of<MenuBloc>(context).add(
                        FetchMenuData(
                            BlocProvider.of<RestaurantBloc>(context).resid),
                      );
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
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: data == null ? 0 : data.length,
                          itemBuilder: (context, index) {
                            BlocBuilder<ReviewBloc, ReviewState>(
                              builder: (context, state) {
                                if (state is LoadingReview) {
                                  return LinearProgressIndicator();
                                }
                                if (state is ReviewLoaded) {
                                  return ReviewDetailScreen(
                                    reviewlist,
                                  );
                                }
                                if (state is ReviewFailedLoad) {
                                  return Center(
                                    child: Text(
                                      'Failed To Load',
                                      style: GoogleFonts.inter(fontSize: 30),
                                    ),
                                  );
                                }
                                return RestaurantHome();
                              },
                            );
                            return UserReview(data[index]);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
                'assets/personicon.jpg',
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
                    review.username.toString(),
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
                      review.rating.toString(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ]),
                  Text(
                    review.feedback.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
