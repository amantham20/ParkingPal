import 'package:flutter/material.dart';
import 'package:parkingpal/comp/customdraw.dart';
import 'package:parkingpal/comp/customnav.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({Key? key}) : super(key: key);

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: const CustomDrawer(),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(23, 15, 23, 0),
            child: Text(
              'Location',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(23, 15, 23, 0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter location",
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(23, 15, 23, 0),
            child: Text(
              'Price',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(23, 15, 23, 0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter price",
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // create an elevated button with green color for submit
          Padding(
            padding: EdgeInsets.fromLTRB(23, 15, 23, 0),
            child: RaisedButton(
              color: Colors.green,
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print("Hello");
              },
            ),
          ),
        ],
      ),
    );
  }
}
