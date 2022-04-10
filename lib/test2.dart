import 'package:flutter/material.dart';
import 'package:parkingpal/comp/customdrawhome.dart';
import 'package:parkingpal/comp/customnav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Test2Class extends StatefulWidget {
  const Test2Class({Key? key}) : super(key: key);

  @override
  State<Test2Class> createState() => _Test2ClassState();
}

class _Test2ClassState extends State<Test2Class> {
  final Stream<QuerySnapshot> rental =
      FirebaseFirestore.instance.collection('rentals').snapshots();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream: rental,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading...');
                }
                final data = snapshot.requireData;
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    final item = data.docs[index];
                    return Card(
                      child: ListTile(
                        title: Text(item['loc']),
                        // convert price to string and add $ and make it in subtitile
                        subtitle: Text("\$ " + item['price'].toString()),
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
              })),
    );
  }
}
