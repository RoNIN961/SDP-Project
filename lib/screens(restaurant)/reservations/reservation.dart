import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/reservations/reservationBloc.dart';
import '../../bloc/reservations/reservationModel.dart';
import '../../bloc/restaurant/restaurantBloc.dart';
import '../home/restaurant_home.dart';

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  List<ReservationModel> data = [];

  @override
  void initState() {
    String resid = BlocProvider.of<RestaurantBloc>(context).resid;
    BlocProvider.of<ReservationBloc>(context).add(FetchReservationData(resid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = BlocProvider.of<ReservationBloc>(context).result;

    return ListView(
      children: [
        BlocBuilder<ReservationBloc, ReservationState>(
          builder: (context, state) {
            if (state is LoadingReservation) {
              print(BlocProvider.of<ReservationBloc>(context).state);
              return LinearProgressIndicator();
            }
            if (state is ReservationLoaded) {
              return Reservation();
            }
            if (state is ReservationFailedLoad) {
              return Center(
                child: Text(
                  'No Data Fetched',
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

class Reservation extends StatefulWidget {
  @override
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  @override
  Widget build(BuildContext context) {
    List<ReservationModel> data =
        BlocProvider.of<ReservationBloc>(context).result;

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Reservation',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data == null ? 0 : data.length,
                      itemBuilder: (context, index) {
                        return ReservationListCard(data[index]);
                      },
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class ReservationListCard extends StatelessWidget {
  final reservationlist;
  ReservationListCard(this.reservationlist);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
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
            right: 10,
            child: Image.asset(
              'assets/personicon.jpg',
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  reservationlist.username,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  reservationlist.date,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  reservationlist.time,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Pax: ${reservationlist.pax}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
