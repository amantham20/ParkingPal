import 'package:flutter/material.dart';
import 'package:parkingpal/globalvar.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, this.onChanged})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  final void Function(String)? onChanged;

  @override
  Size preferredSize;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
  }

  // create a custom nav bar with 2 buttons and logo in the middle. One button for the menu and one for the back
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: logo(50),
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
      actions: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildAppBar(context);
  }
}
