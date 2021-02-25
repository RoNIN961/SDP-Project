import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sdp_project/bloc/custotal/custotalBloc.dart';
import 'package:sdp_project/bloc/custotal/custotalModel.dart';

import '../../bloc/login/loginBloc.dart';
import '../../theme/custom.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<CusTotalModel> data = [];
  @override
  void initState() {
    String resid = BlocProvider.of<LoginBloc>(context).userid;
    BlocProvider.of<CusTotalBloc>(context).add(
      FetchCusTotalData(resid),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String username = BlocProvider.of<LoginBloc>(context).name;
    String useremail = BlocProvider.of<LoginBloc>(context).email;

    data = BlocProvider.of<CusTotalBloc>(context).result;

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                height: 70,
                child: Text(
                  'Profile',
                  style: GoogleFonts.inter(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: 220,
                height: 220,
                child: Container(
                  width: 150,
                  height: 150,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange,
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/personicon.jpg'),
                      radius: 30.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                username,
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.blueGrey,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 20),
              Text(
                useremail,
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.blueGrey,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 30,
              ),
              BlocBuilder<CusTotalBloc, CusTotalState>(
                builder: (context, state) {
                  if (state is LoadingCusTotal) {
                    return LinearProgressIndicator();
                  }
                  if (state is CusTotalLoaded) {
                    return TotalRecipeCard();
                  }
                  if (state is CusTotalFailedLoad) {
                    return ProfilePage();
                  }
                  return ProfilePage();
                },
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  child: Center(
                child: CustomButton3(
                  text: 'Edit Profile',
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit_profile');
                  },
                ),
              ))
            ],
          ),
        ));
  }
}

class TotalRecipeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CusTotalModel> data = BlocProvider.of<CusTotalBloc>(context).result;

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Total Recipes",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    data[0].totalrecipe,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
