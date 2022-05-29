import 'dart:async';

import 'package:fitnessapp/AppLayer/Provider.dart';
import 'package:fitnessapp/ViewScreen/GetCatagoryCourses/GetCatagoryCoursesManager.dart';
import 'package:fitnessapp/ViewScreen/SplashScreen/Dictionary/DictionaryManager.dart';
import 'package:fitnessapp/ViewScreen/SplashScreen/splashScreen2.dart';
import 'package:flutter/material.dart';

class SPlashScreen1 extends StatefulWidget {

  @override
  _SPlashScreen1State createState() => _SPlashScreen1State();
}

class _SPlashScreen1State extends State<SPlashScreen1> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SplashScreen2(),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    DictionaryManager manager  = Provider.of(context).fetch(DictionaryManager());

    return Container();
  }
}
