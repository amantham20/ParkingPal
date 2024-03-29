import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parkingpal/comp/customdrawlisting.dart';
import 'package:parkingpal/globalvar.dart';
import 'package:parkingpal/comp/customdrawabout.dart';
import 'package:parkingpal/comp/customnav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:parkingpal/home.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({Key? key}) : super(key: key);

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  CollectionReference rental = FirebaseFirestore.instance.collection('rentals');
  final geo = GeoFlutterFire();

  String location = '';
  double price = 0;
  bool isParking = false;
  @override
  void initState() {
    super.initState();
    nosecurity = 4;
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    nosecurity = 4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: const CustomDrawlisting(),
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
            padding: const EdgeInsets.fromLTRB(23, 15, 23, 0),
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
          Padding(
            padding: EdgeInsets.fromLTRB(23, 15, 23, 0),
            child: Row(
              children: <Widget>[
                const Text(
                  'Is this a free spot?',
                  style: TextStyle(fontSize: 20.0),
                ),
                Checkbox(
                  value: isParking,
                  onChanged: (value) {
                    setState(() {
                      isParking = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          isParking == false
              ? const Padding(
                  padding: EdgeInsets.fromLTRB(23, 15, 23, 0),
                  child: Text(
                    'Price',
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
              : const SizedBox(
                  height: 20,
                ),
          isParking == false
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(23, 15, 23, 0),
                  child: TextField(
                    onChanged: (value) {
                      price = double.parse(value);
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter price",
                    ),
                  ),
                )
              : const SizedBox(
                  height: 20,
                ),
          // create an elevated button with green color for submit
          Padding(
            padding: const EdgeInsets.fromLTRB(23, 15, 23, 0),
            child: RaisedButton(
              color: Colors.green,
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                rental
                    .add({
                      'price': isParking == false ? price : 0,
                      'crimes': true,
                      'parking': false,
                      'loc': location,
                      'point': geo
                          .point(latitude: 42.2701, longitude: -84.270901)
                          .data,
                    })
                    .then((value) => print("added"))
                    .catchError((error) => print(error));
                movePage(const HomePage(), context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
