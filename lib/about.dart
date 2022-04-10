import 'package:flutter/material.dart';
import 'package:parkingpal/globalvar.dart';
import 'package:parkingpal/home.dart';

import 'comp/customdraw.dart';
import 'comp/customnav.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 15, right: 5, left: 5),
              child: Text(
                "Our dreams and mission:",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "We are a group of software engineering enthusiest. We have come together to form our product:\n",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            picture("logo", 100),
            const Text(
              'Parking Pal',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "\nOn average, people spend over \$3000 a year on parking. That is an waste of your money with how many driveways and reserved parking spots go unused.\n\nOur mission statement is to prioritize and support our community, and doing so by providing them a more reliable and cheaper method of parking.",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 15, left: 5, right: 5),
              child: Text(
                "\nOur team members:",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            picture("Aman_Profile", 100),
            const Text(
              "Aman Dhruva Thaminana",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "A sophmore attending Michigan State University double majoring in Mathematics and Computer Science while double minoring in Entrepreneurship & Innovation and Computational Mathematics, Science & Engineering.\n",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            // CircularProfileAvatar
            picture("Raj_Profile", 100),
            const Text(
              "Rajmeet Singh Chandok",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "A sophmore attending Michigan State University majoring in Computer Science while double minoring in Entrepreneurship & Innovation and Computational Mathematics, Science & Engineering.\n",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            picture("Kollin_Profile", 100),
            const Text(
              "Kollin Michael Bartz",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "A sophmore attending Michigan State University majoring Computer Science while double minoring in Mathmatics and Computational Mathematics, Science & Engineering.\n",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Text(
                "What and how is Parking Pal?",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15, left: 10, right: 10),
              child: Text(
                "This is an app to help people save on parking costs and to help people find reasonable parking spots. It is a mult-purpose app though. It has the functionality of a map that displays both location and all the rentable parking spots within our database. We also have the functionality to post your parking spot, once confirmed to our database so it is visible for renters to rent when they are in need. The application can not only show the user all available spots, but also allow the user to mark their spot as taken after they have purchased it.",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
