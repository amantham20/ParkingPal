import 'package:flutter/material.dart';

import 'package:latlng/latlng.dart';

int nosecurity = 0;

movePage(page, context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

Image picture(String name, double height) {
  return Image.asset("assets/$name.png", height: height);
}

final markers = [
  LatLng(42.7370, -84.4893),
  LatLng(43.573, -84.484),
  LatLng(43.7370, -84.45),
  LatLng(42.4231, -84.270901),
  LatLng(42.2712, -84.270901),
  LatLng(42.2732, -84.270901),
  LatLng(42.7302, -84.4829629),
  LatLng(42.7358761, -84.4809629),
  LatLng(42.730957, -84.484648),
  LatLng(42.723843, -84.482872),
];
