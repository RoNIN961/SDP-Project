import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../bloc/login/loginBloc.dart';
import 'package:http/http.dart' as http;
import '../../theme/custom.dart';

class BookReservation extends StatefulWidget {
  final resdata;
  BookReservation(this.resdata);

  @override
  _BookReservationState createState() => _BookReservationState(resdata);
}

class _BookReservationState extends State<BookReservation> {
  final resdata;
  _BookReservationState(this.resdata);

  DateTime pickedDate;
  TimeOfDay time;

  String title = 'DropDownButton';
  String _paxlist;
  List _paxname = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

  Future addBooking() async {
    try {
      String userid = BlocProvider.of<LoginBloc>(context).userid;
      String resid = resdata.resid;
      String bookingtime = '${time.hour}:${time.minute}';
      String bookingdate =
          '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';

      var url = 'https://czechoslovakian-scr.000webhostapp.com/add_booking.php';

      var data = {
        'userid': userid,
        'resid': resid,
        'bookingdate': bookingdate,
        'bookingtime': bookingtime,
        'pax': _paxlist,
      };

      var response = await http.post(url, body: data);

      var message = response.body;

      if (message == 'Booking Added Successfully!') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text('Booking Added!'),
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

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDate,
    );
    if (date != null)
      setState(() {
        pickedDate = date;
      });
  }

  _pickTime() async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: time);
    if (t != null)
      setState(() {
        time = t;
      });
  }

  Widget inputPax() {
    return Container(
      width: 100,
      padding: EdgeInsets.only(left: 16, right: 16),
      child: DropdownButton(
        hint: Text('Pax'),
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepOrange),
        underline: Container(height: 2, width: 2, color: Colors.deepOrange),
        isExpanded: true,
        value: _paxlist,
        onChanged: (value) {
          setState(() {
            _paxlist = value;
          });
        },
        items: _paxname.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: <Widget>[
              Card(
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl:
                      'https://czechoslovakian-scr.000webhostapp.com/uploads(Profile)/${widget.resdata.image}',
                  placeholder: (context, url) =>
                      new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                  fadeOutDuration: new Duration(seconds: 1),
                  fadeInDuration: new Duration(seconds: 3),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.white70,
                ),
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Row(
                      children: [
                        Text(
                          'Booking Date',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(width: 200),
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Date: ${pickedDate.year}, ${pickedDate.month}, ${pickedDate.day}",
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.keyboard_arrow_down),
                onTap: _pickDate,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.white70,
                ),
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Row(
                      children: [
                        Text(
                          'Booking Time',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(width: 200),
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Time: ${time.hour}:${time.minute}",
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.keyboard_arrow_down),
                onTap: _pickTime,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.white70,
                ),
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Row(
                      children: [
                        Text(
                          'Total pax',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          width: 180,
                        ),
                        inputPax()
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                child: CustomButton1(
                  onPressed: addBooking,
                  text: 'Book Now',
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class PaxDropDownButton extends StatefulWidget {
  @override
  _PaxDropDownButtonState createState() => _PaxDropDownButtonState();
}

class _PaxDropDownButtonState extends State<PaxDropDownButton> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepOrange),
      underline: Container(height: 2, width: 2, color: Colors.deepOrange),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['One', 'Two', 'Three', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );
  }
}
