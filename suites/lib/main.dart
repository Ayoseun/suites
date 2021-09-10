import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:suites/constants/constants.dart';
import 'package:suites/onboarding/Onboarding.dart';
import 'package:suites/screens/landpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //this gets the width of the complete screen
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      //remove debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: color_darkerBlue,
          accentColor: color_darkerBlue,
          //check screenwidth and if it is less than 500 use Text_small else use text_default
          textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
          //set font family
          fontFamily: "Montserrat"),
      home: LandPage(),
    );
  }
}
