import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/RecomendationScreens/Recmendation8.dart';
import 'package:fitnessapp/ViewScreen/RecomendationScreens/Recommendation9.dart';
import 'package:fitnessapp/widget/naseerWidgets/CustomButton.dart';
import 'package:fitnessapp/widget/naseerWidgets/ThemeContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Theme2 extends StatefulWidget {
  @override
  _Theme2State createState() => _Theme2State();
}

class _Theme2State extends State<Theme2> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Theme'.tr,
          style: TextStyle(color: Colors.black, letterSpacing: 1),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => Recmendation8()));
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              CircleAvatar(
                maxRadius: 30,
                backgroundColor: Color(0xffFF69BF),
                child: Icon(
                  Icons.wb_sunny_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '2 Different Mode'.tr,
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'You can change the app Theme'.tr,
                style: TextStyle(color: Colors.grey[300]),
              ),
              SizedBox(
                height: 50,
              ),
              ThemeContainer(
                icon: Icons.whatshot,
                status: false,
                txt: 'Switch to dark theme'.tr,
              ),
              SizedBox(
                height: 20,
              ),
              ThemeContainer(
                icon: Icons.whatshot,
                status: false,
                txt: 'Switch to yellow theme'.tr,
              ),
              SizedBox(
                height: Get.height * 0.2,
              ),
              InkWell(
                onTap: () {
                  // Get.to(Recommendation9());
                },
                child: CustomButton(
                  buttonName: 'Save'.tr,
                  color: Overseer.isColor
                      ? MyAppColors.pickcolor
                      : MyAppColors.orangcolors,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
