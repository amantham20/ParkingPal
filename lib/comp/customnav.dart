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

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        title: logo(50),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.menu_rounded,
            size: 25.0,
            color: Colors.green,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return buildAppBar(context);
  }
}
