import 'package:flutter/material.dart';

int nosecurity = 0;

movePage(page, context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

Image picture(String name, double height) {
  return Image.asset("assets/$name.png", height: height);
}
