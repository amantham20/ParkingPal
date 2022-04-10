import 'package:flutter/material.dart';
import 'package:parkingpal/globalvar.dart';
import 'package:parkingpal/home.dart';
import 'package:parkingpal/login.dart';

import '../HomeTermsPage.dart';
import '../about.dart';
import '../listing.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomDrawhometerms extends StatefulWidget {
  const CustomDrawhometerms({Key? key}) : super(key: key);
  @override
  State<CustomDrawhometerms> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawhometerms> {
  @override
  Widget build(BuildContext context) {
    // create a custom drawer with 4 list items and a button to close the drawer on the right.
    // The drawer is closed by default and can be opened by clicking the menu button on the top left.
    // drawer will have home, about, add listing and settings
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // close the drawer
              Navigator.of(context).pop();
              movePage(const HomePage(), context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.of(context).pop();
              movePage(const AboutPage(), context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.pageview),
            title: const Text('Terms & Conditions'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.add_location),
            title: const Text('Add Listing'),
            onTap: () {
              Navigator.of(context).pop();
              movePage(const ListingPage(), context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              FirebaseAuth.instance.signOut();
              movePage(const LoginPage(), context);
            },
          ),
        ],
      ),
    );
  }
}
