import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:parkingpal/globalvar.dart';
import 'package:parkingpal/home.dart';
import 'package:parkingpal/login.dart';

class CustomAppBarHome extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBarHome({Key? key, this.onChanged})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  final void Function(String)? onChanged;

  @override
  Size preferredSize;

  @override
  State<CustomAppBarHome> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBarHome> {
  @override
  void initState() {
    super.initState();
  }

  // create a custom nav bar with 2 buttons and logo in the middle. One button for the menu and one for the back
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: picture("logo", 50),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        onPressed: () {
          // open the drawer
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildAppBar(context);
  }
}
