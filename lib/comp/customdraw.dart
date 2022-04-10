import 'package:flutter/material.dart';
import 'package:parkingpal/globalvar.dart';

import '../about.dart';
import '../listing.dart';
import '../settings.dart';

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
              movePage(const AboutPage(), context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_location),
            title: const Text('Add Listing'),
            onTap: () {
              movePage(const ListingPage(), context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              movePage(const SettingsPage(), context);
            },
          ),
        ],
      ),
    );
  }
}
