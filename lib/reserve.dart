import 'package:flutter/material.dart';
import 'package:parkingpal/comp/customdraw.dart';
import 'package:parkingpal/comp/customnav.dart';

class ReservePage extends StatefulWidget {
  const ReservePage({Key? key}) : super(key: key);

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: const CustomDrawer(),
      // Make with a slider for how many hours you want to reserve from 1 to 10.
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            const Text("Number of hours", style: TextStyle(fontSize: 20)),
            Slider(
              value: value,
              min: 0,
              max: 10,
              divisions: 10,
              onChanged: (newValue) {
                setState(() {
                  value = newValue;
                });
              },
            ),
            Text("$value", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
