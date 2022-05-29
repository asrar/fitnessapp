import 'dart:async';

import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/ViewScreen/Homepages/homepage1.dart';
import 'package:fitnessapp/ViewScreen/SplashScreen/splashScreen3.dart';
import 'package:fitnessapp/ViewScreen/Homepages/homepage6.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {


  @override
  void initState() {
    super.initState();
    getValidation().whenComplete(() async{
      Timer(
        Duration(seconds: 2),
            () => Get.to(Overseer.userId == null ? SplashScreen3() : HomePage1()),
      );
    });
  }
  Future getValidation () async{
    final SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    var obtainUserId = _sharedPreferences.getInt("userId");
    setState(() {
      Overseer.userId = obtainUserId!;
    });
    // _sharedPreferences.setInt('userId', Overseer.userId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: double.infinity,
            height: Get.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/slashimage.png"),
                  colorFilter:
                  ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.darken),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 183,
                  child: Image.asset(
                    "assets/image/Group 10.png",
                    colorBlendMode: BlendMode.darken,
                  ),
                ),
                SizedBox(
                  height: Get.height*0.015,
                ),
                Image.asset("assets/image/font.png"),
               SizedBox(height: 10,),
                Image.asset("assets/image/12 font.png")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
