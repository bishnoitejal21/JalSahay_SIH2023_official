import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Responsive{
  static late double screenWidth;
  static late double screenHeight;
  static late double ph;
  static late double pw;

  void init(BuildContext context) {
    ph = MediaQuery.of(context).size.width;
    pw = MediaQuery.of(context).size.height;
  }
}
