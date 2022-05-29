import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/ForgetPassword/ConfirmPassword/confirmPassword.dart';
import 'package:fitnessapp/ViewScreen/ForgetPassword/ForgetPasswordEmailEntry/ForgetPassword.dart';
import 'package:fitnessapp/ViewScreen/UpdateFitnessProfile/ProfileInformation/Gender.dart';
import 'package:fitnessapp/widget/naseerWidgets/CustomButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class Send_OTP_Password extends StatefulWidget {
  @override
  _Send_OTP_PasswordState createState() => _Send_OTP_PasswordState();
}

class _Send_OTP_PasswordState extends State<Send_OTP_Password> {
  bool isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => ForgetPassword()));
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
              color: Color(0xffEDA024),
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
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter the 4-digit code sent to at ".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "john21@gmail.com.",
                style: TextStyle(color: Colors.grey[400], letterSpacing: 1),
              ),
              SizedBox(
                height: 40,
              ),
              OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: Get.width * 0.12,
                style: TextStyle(fontSize: 13),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
              ),
              SizedBox(
                height: Get.height * 0.45,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConfirmPassword_Screen()));
                },
                child: CustomButton(
                  buttonName: 'Next'.tr,
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
