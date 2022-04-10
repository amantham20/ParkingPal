import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parkingpal/comp/customdraw.dart';
import 'package:parkingpal/comp/customnav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({Key? key}) : super(key: key);

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  CollectionReference rental = FirebaseFirestore.instance.collection('rentals');
  final geo = GeoFlutterFire();

  String location = '';
  int price = 0;
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
          Padding(
            padding: EdgeInsets.fromLTRB(23, 15, 23, 0),
            child: TextField(
              onChanged: (value) {
                location = value;
              },
              decoration: const InputDecoration(
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
          Padding(
            padding: EdgeInsets.fromLTRB(23, 15, 23, 0),
            child: TextField(
              onChanged: (value) {
                price = int.parse(value);
              },
              decoration: const InputDecoration(
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
                rental
                    .add({
                      'price': price,
                      'crimes': true,
                      'parking': false,
                      'loc': "East Lasning",
                      'point': geo
                          .point(latitude: 42.2701, longitude: -84.270901)
                          .data,
                    })
                    .then((value) => print("added"))
                    .catchError((error) => print(error));
              },
            ),
          ),
        ],
      ),
    );
  }
}
