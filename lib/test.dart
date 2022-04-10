import 'package:flutter/material.dart';
import 'package:parkingpal/comp/customdraw.dart';
import 'package:parkingpal/comp/customnav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parkingpal/globalvar.dart';
import 'package:parkingpal/reserve.dart';
import 'package:parkingpal/test2.dart';

class TestClass extends StatefulWidget {
  const TestClass({Key? key}) : super(key: key);

  @override
  State<TestClass> createState() => _TestClassState();
}

class _TestClassState extends State<TestClass> {
  final Stream<QuerySnapshot> rental =
      FirebaseFirestore.instance.collection('rentals').snapshots();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: StreamBuilder<QuerySnapshot>(
          stream: rental,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Loading...');
            }
            final data = snapshot.requireData;
            return ListView.builder(
              itemCount: data.size,
              itemBuilder: (BuildContext context, int index) {
                final item = data.docs[index];

                return Card(
                  child: ListTile(
                    title: Text(item['loc']),
                    // convert price to string and add $ and make it in subtitile
                    subtitle: item['price'] == 0
                        ? const Text("Free Parking")
                        : Text("\$ " + item['price'].toString()),
                    onTap: () {
                      movePage(ReservePage(), context);
                    },
                  ),
                );
              },
            );
            // return ListView.builder(
            //     itemCount: data.size,
            //     itemBuilder: (context, index) {
            //       print("Location");
            //       print(data.docs[index]['loc']);
            //       print("Longitude");
            //       print(data.docs[index]['point']);
            //       // print("Latitude");
            //       // print(data.docs[index]['point'].latitude);
            //       print("Price");
            //       print(data.docs[index]['price']);
            //       return Container();
            //     });
          }),
    );
  }
}
