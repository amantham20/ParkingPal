import 'package:flutter/material.dart';
import 'package:parkingpal/comp/customdrawlistingrev.dart';
import 'package:parkingpal/comp/customnav.dart';
import 'package:parkingpal/globalvar.dart';
import 'package:parkingpal/home.dart';

class ReservePage extends StatefulWidget {
  const ReservePage({Key? key}) : super(key: key);

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  double value = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nosecurity = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: const CustomDrawlistingRev(),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: picture("logo", 200),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  "How many hours would you like to reserve?",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Slider(
              value: value,
              min: 0,
              max: 24,
              divisions: 24,
              label: value.toString(),
              onChanged: (double newValue) {
                setState(() {
                  value = newValue;
                });
              },
            ),
            Text(
              "You have selected " + value.toString() + " hours",
              style: const TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                child: const Text("Reserve"),
                onPressed: () {
                  movePage(HomePage(), context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
