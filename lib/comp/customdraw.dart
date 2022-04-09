import 'package:flutter/material.dart';
import 'package:parkingpal/globalvar.dart';
import 'package:parkingpal/login.dart';

import '../about.dart';
import '../listing.dart';
import '../settings.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
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
            child: Text('Menu'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              movePage(AboutPage(), context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_location),
            title: const Text('Add Listing'),
            onTap: () {
              movePage(ListingPage(), context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              movePage(LoginPage(), context);
            },
          ),
        ],
      ),
    );
  }
}
