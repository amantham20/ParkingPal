import 'package:flutter/material.dart';

movePage(page, context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

Image logo(double height) {
  return Image.asset("assets/logo.png", height: height);
}
