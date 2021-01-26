import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class CustomRestaurantListView extends StatefulWidget {
  @override
  _CustomRestaurantListViewState createState() =>
      _CustomRestaurantListViewState();
}

class _CustomRestaurantListViewState extends State<CustomRestaurantListView> {
  List data;

  Future<String> getJSONData() async {
    var response = await http.get(
      // Encode the url
      Uri.encodeFull(
          "https://czechoslovakian-scr.000webhostapp.com/restaurantprofile.php"),
      // Only accept JSON response
      headers: {"Accept": "application/json"},
    );

    setState(() {
      // Get the JSON data
      data = jsonDecode(response.body);
    });

    return "Successfull";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: new BoxDecoration(boxShadow: [
        new BoxShadow(
          color: Color(0xffeeeeee),
          blurRadius: 1.0,
          offset: new Offset(1.0, 1.0),
        ),
      ]),
      child: Card(
        child: InkWell(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text(
                "New & Updated Restaurants",
                style: TextStyle(color: Color(0xff616161), fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 3.0),
              child: Text(
                "Selected Restaurants For You",
                style: TextStyle(color: Color(0xff616161), fontSize: 12.0),
              ),
            ),
            Expanded(child: _buildListView()),
          ],
        )),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding:
            const EdgeInsets.only(top: 15.00, bottom: 15.00, left: 8, right: 4),
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: _buildImageColumn(data[index]),
          );
          // return _buildRow(data[index]);
        });
  }

  Widget _buildImageColumn(dynamic item) => Container(
        decoration: BoxDecoration(color: Colors.white54),
        margin: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new CachedNetworkImage(
              width: 200,
              height: 100,
              fit: BoxFit.fill,
              imageUrl:
                  'https://czechoslovakian-scr.000webhostapp.com/uploads(Restaurant)/${item['Rest_Profile_Pic']}',
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
              fadeOutDuration: new Duration(seconds: 1),
              fadeInDuration: new Duration(seconds: 3),
            ),
            SizedBox(
              height: 15,
            ),
            _buildRow(item)
          ],
        ),
      );

  Widget _buildRow(dynamic item) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(2.0),
              ),
              Text(
                item['Restaurant_Name'] == null ? '' : item['Restaurant_Name'],
                style: TextStyle(
                    color: Color(0xff202124),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: EdgeInsets.all(6.0),
              ),
              Text(
                item['Email'] == null ? '' : item['Email'],
                style: TextStyle(
                    color: Color(0xff5f6368),
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Padding(
          padding: EdgeInsets.all(2.0),
          child: MaterialButton(
            onPressed: null,
            child: Text('More Info'),
            color: Colors.deepOrange,
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    // Call the getJSONData() method when the app initializes
    this.getJSONData();
  }
}

class CustomRecipeListView extends StatefulWidget {
  @override
  _CustomRecipeListViewState createState() => _CustomRecipeListViewState();
}

class _CustomRecipeListViewState extends State<CustomRecipeListView> {
  List data;

  Future<String> getJSONData() async {
    var response = await http.get(
      // Encode the url
      Uri.encodeFull(
          "https://czechoslovakian-scr.000webhostapp.com/recipe_info.php"),
      // Only accept JSON response
      headers: {"Accept": "application/json"},
    );

    setState(() {
      // Get the JSON data
      data = jsonDecode(response.body);
    });

    return "Successfull";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: new BoxDecoration(boxShadow: [
        new BoxShadow(
          color: Color(0xffeeeeee),
          blurRadius: 1.0,
          offset: new Offset(1.0, 1.0),
        ),
      ]),
      child: Card(
        child: InkWell(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text(
                "New & Updated Recipe",
                style: TextStyle(color: Color(0xff616161), fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 3.0),
              child: Text(
                "Selected Recipes For You",
                style: TextStyle(color: Color(0xff616161), fontSize: 12.0),
              ),
            ),
            Expanded(child: _buildListView()),
          ],
        )),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding:
          const EdgeInsets.only(top: 15.00, bottom: 15.00, left: 8, right: 4),
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: _buildImageColumn(data[index]),
        );
        // return _buildRow(data[index]);
      },
    );
  }

  Widget _buildImageColumn(dynamic item) => Container(
        decoration: BoxDecoration(color: Colors.white54),
        margin: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new CachedNetworkImage(
              width: 200,
              height: 100,
              fit: BoxFit.fill,
              imageUrl:
                  'https://czechoslovakian-scr.000webhostapp.com/uploads(Recipe)/${item['Directory']}',
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
              fadeOutDuration: new Duration(seconds: 1),
              fadeInDuration: new Duration(seconds: 3),
            ),
            SizedBox(
              height: 15,
            ),
            _buildRow(item)
          ],
        ),
      );

  Widget _buildRow(dynamic item) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(2.0),
              ),
              Text(
                item['Recipe_Title'] == null ? '' : item['Recipe_Title'],
                style: TextStyle(
                    color: Color(0xff202124),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: EdgeInsets.all(6.0),
              ),
              Text(
                item['Username'] == null ? '' : item['Username'],
                style: TextStyle(
                    color: Color(0xff5f6368),
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Padding(
          padding: EdgeInsets.all(2.0),
          child: MaterialButton(
            onPressed: null,
            child: Text('More Info'),
            color: Colors.deepOrange,
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    // Call the getJSONData() method when the app initializes
    this.getJSONData();
  }
}
