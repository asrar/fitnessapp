import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/widget/naseerWidgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Recmendation8 extends StatefulWidget {
  @override
  _Recmendation8State createState() => _Recmendation8State();
}

class _Recmendation8State extends State<Recmendation8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          SizedBox(height: Get.height*0.5,),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60))),
            height: MediaQuery.of(context).size.height * 0.50,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: 3,
                    width: 50,
                    color: Colors.grey[300],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Icon(
                    Icons.error_outline,
                    size: 80,
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "oops - you can't get working this game in your device".tr,
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 30,),
                  InkWell(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Theme2()));
                    },
                    child: CustomButton(
                      buttonName: 'Back'.tr,
                      color: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
