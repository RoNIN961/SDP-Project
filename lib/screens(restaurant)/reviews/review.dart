import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/menu/menuBloc.dart';
import '../../bloc/menu/menuModel.dart';
import '../../bloc/restaurant/restaurantBloc.dart';
import '../../bloc/review/reviewBloc.dart';
import '../home/restaurant_home.dart';
import 'review_details.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  List<MenuModel> data = [];

  @override
  void initState() {
    String resid = BlocProvider.of<RestaurantBloc>(context).resid;
    BlocProvider.of<MenuBloc>(context).add(FetchMenuData(resid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        BlocBuilder<MenuBloc, MenuState>(
          builder: (context, state) {
            if (state is LoadingMenu) {
              return LinearProgressIndicator();
            }
            if (state is MenuLoaded) {
              return Review();
            }
            if (state is MenuFailedLoad) {
              return Center(
                child: Text(
                  'Failed To Load',
                  style: GoogleFonts.inter(fontSize: 30),
                ),
              );
            }
            return RestaurantHome();
          },
        ),
      ],
    );
  }
}

class Review extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<MenuModel> data = BlocProvider.of<MenuBloc>(context).result;

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
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (context, index) {
                  return MenuReview(data[index]);
                },
              ),
            )
          ],
        ),
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
        child: Stack(children: <Widget>[
          Positioned(
            top: 10,
            left: 10,
            child: CachedNetworkImage(
              imageUrl:
                  'https://czechoslovakian-scr.000webhostapp.com/uploads(Menu)/${reviewlist.image}',
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.30,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 160),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  reviewlist.menuname,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Color(0xffFF8573),
                    ),
                    SizedBox(width: 5),
                    SizedBox(
                      width: 50,
                      child: Text(
                        reviewlist.menuid,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ReviewDetailScreen(reviewlist),
                              ),
                            );
                            BlocProvider.of<ReviewBloc>(context).add(
                              FetchReviewData(reviewlist.menuid),
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
                          )),
                    )
                  ],
                ),
              ],
            ),
          )
        ]));
  }
}
