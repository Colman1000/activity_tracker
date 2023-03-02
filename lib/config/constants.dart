import 'package:flutter/material.dart';

class Constants {
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static Curve curve = Curves.bounceInOut;
  static Duration duration = const Duration(milliseconds: 150);
  static String baseUrl = 'https://boredapi.com/api/';
}
