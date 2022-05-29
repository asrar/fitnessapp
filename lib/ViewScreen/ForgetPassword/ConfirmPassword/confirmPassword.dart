import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/StartTrial/startScreen.dart';
import 'package:fitnessapp/widget/myTextField.dart';
import 'package:fitnessapp/widget/naseerWidgets/CustomButton.dart';
import 'package:fitnessapp/widget/passwordtext_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmPassword_Screen extends StatefulWidget {
  const ConfirmPassword_Screen({Key? key}) : super(key: key);

  @override
  _ConfirmPassword_ScreenState createState() => _ConfirmPassword_ScreenState();
}

class _ConfirmPassword_ScreenState extends State<ConfirmPassword_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "PLease enter your new Password"
                      .tr,
                  style: TextStyle(color: Colors.black, letterSpacing: 1),
                ),
                SizedBox(
                  height: 20,
                ),
                MyPassword_TextField(
                  icon: Icons.lock,
                  title: "Password",
                  onChanged: null,
                  errortext: "",
                  obsecure: true,
                ),
                SizedBox(height: 10,),
                MyPassword_TextField(
                  icon: Icons.lock,
                  title: "Confirm Password",
                  onChanged: null,
                  errortext: "",
                  obsecure: true,
                ),
                SizedBox(
                  height: Get.height * 0.41,
                ),
                InkWell(
                    onTap: () {
                      Get.to(StartScreen());
                    },
                    child: CustomButton(
                      color: Overseer.isColor
                          ? MyAppColors.pickcolor
                          : MyAppColors.orangcolors,
                      buttonName: 'Submit'.tr,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
