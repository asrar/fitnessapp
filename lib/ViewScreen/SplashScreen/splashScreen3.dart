import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/SingUp/signUpScreen.dart';
import 'package:fitnessapp/widget/buttonIconWithText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen3 extends StatefulWidget {
  @override
  _SplashScreen3State createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
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
                  image: AssetImage(
                    "assets/image/slashimage.png",
                  ),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.8), BlendMode.darken),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: Get.height * 0.15,
                  width: 183,
                  child: Image.asset(
                    "assets/image/Group 10.png",
                    colorBlendMode: BlendMode.darken,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.015,
                ),
                Image.asset("assets/image/font.png"),
                SizedBox(
                  height: Get.height * 0.013,
                ),
                Image.asset("assets/image/12 font.png"),
                SizedBox(
                  height: Get.height * 0.1,
                ),

                Text(
                  "${Overseer.home_text}".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
                SizedBox(height: Get.height * 0.013),
                Text(
                  "${Overseer.home_text_2nd}".tr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                ButtonIconWithText(
                  title: "Continue With Facebook".tr,
                  image: "assets/image/3689126.png",
                  containercolor: MyAppColors.facecolors,
                  textcolor: Colors.white,
                  ontap: () {},
                  shadowColor: MyAppColors.facecolors,
                ),
                SizedBox(
                  height: Get.height * 0.012,
                ),
                ButtonIconWithText(
                  title: "Continue With Google".tr,
                  image: "assets/image/googlewe.png",
                  containercolor: Colors.white,
                  ontap: () {},
                  shadowColor: Colors.white,
                  textcolor: Colors.black.withOpacity(0.2),
                ),
                SizedBox(
                  height: 10,
                ),
                ButtonIconWithText(
                  title: "Continue With Apple ID".tr,
                  image: "assets/image/Icons.png",
                  containercolor: Colors.black.withOpacity(0.3),
                  ontap: () {},
                  shadowColor: Colors.white,
                  textcolor: Colors.black.withOpacity(0.2),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      Get.to(SignUpScreen());
                    },
                    child: Text(
                      "Create Account With Email".tr,
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
