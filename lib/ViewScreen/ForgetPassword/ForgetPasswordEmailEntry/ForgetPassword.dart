import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/widget/myTextField.dart';
import 'package:fitnessapp/widget/naseerWidgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../SendOTP/Send_OTP_Password.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        // centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30,
              height: 3,
              color: Color(0xffEDA024),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 30,
              height: 3,
              color: Colors.grey[300],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    'Sign'.tr,
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sans'.tr),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Forgot password ? ".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter your email and we'll send you instructions on how  to reset your password."
                    .tr,
                style: TextStyle(color: Colors.grey[400], letterSpacing: 1),
              ),
              SizedBox(
                height: 40,
              ),
              MyTextField(
                errortext: "",
                onChanged: null,
                icon: Icons.email,
                title: "Email".tr,
                obsecure: false,
              ),
              SizedBox(
                height: Get.height * 0.4,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Send_OTP_Password()));
                  },
                  child: CustomButton(
                    color: Overseer.isColor
                        ? MyAppColors.pickcolor
                        : MyAppColors.orangcolors,
                    buttonName: 'Recover Password'.tr,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
