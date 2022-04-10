import 'package:flutter/material.dart';
import 'package:parkingpal/comp/customdrawabout.dart';
import 'package:parkingpal/comp/customdrawhome.dart';
import 'package:parkingpal/comp/customnav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: const CustomDrawhome(),
      body: Container(
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
                  itemBuilder: (context, index) {
                    print("Location");
                    print(data.docs[index]['loc']);
                    print("Longitude");
                    print(data.docs[index]['point']);
                    // print("Latitude");
                    // print(data.docs[index]['point'].latitude);
                    print("Price");
                    print(data.docs[index]['price']);
                    return Container();
                  });
            }),
      ),
    );
  }
}
