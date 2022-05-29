import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/AppLayer/Provider.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/ForgetPassword/ForgetPasswordEmailEntry/ForgetPassword.dart';
import 'package:fitnessapp/ViewScreen/LogIn/UserManager.dart';
import 'package:fitnessapp/ViewScreen/SingUp/signUpScreen.dart';
import 'package:fitnessapp/ViewScreen/UpdateFitnessProfile/ProfileInformation/Gender.dart';
import 'package:fitnessapp/widget/MyButton.dart';
import 'package:fitnessapp/widget/myTextField.dart';
import 'package:fitnessapp/widget/passwordtext_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:async';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  @override
  Widget build(BuildContext context) {
    UserManager manager = Provider.of(context).fetch(UserManager);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 22, right: 22, top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          )),
                      GestureDetector(
                          onTap: () {
                            Get.to(SignUpScreen());
                          },
                          child: Text("SigUp".tr))
                    ],
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  Text(
                    "Sign In to Fitness".tr,
                    style: TextStyle(fontSize: 36),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "By signin up you agree to ".tr,
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                              text: "Terms of Use ".tr,
                              style: TextStyle(color: Colors.red)),
                          TextSpan(
                            text: "and Privacy Notice".tr,
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 43,
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  StreamBuilder<String>(
                      stream: manager.email$,
                      builder: (context, snapshot) {
                        return MyTextField(
                          onChanged: (value) {
                            manager.inEmail.add(value);
                          },
                          errortext: snapshot.error == null
                              ? ""
                              : snapshot.error.toString(),
                          obsecure: false,
                          icon: Icons.email_rounded,
                          title: "xyz@gmail.com",
                        );
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<String>(
                      stream: manager.password$,
                      builder: (context, snapshot) {
                        print("Data :  ${snapshot.hasData}");
                        print("error :  ${snapshot.hasError} ");
                        return MyPassword_TextField(
                          onChanged: (value) {
                            manager.inPassword.add(value);
                          },
                          errortext: snapshot.error == null
                              ? ""
                              : snapshot.error.toString(),
                          obsecure: true,
                          icon: Icons.lock,
                          title: "Password",
                        );
                      }),
                  // ShowAndHide(),
                  SizedBox(
                    height: Get.height * 0.2,
                  ),
                  StreamBuilder<Object>(
                    stream: manager.isFormValid$,
                    builder: (context, snapshot) {
                      return MyButton(
                          shadowColor: MyAppColors.orangcolors,
                          ontap: () {
                            Get.snackbar(
                              "Submitting",
                              "Verifying User Details",
                              dismissDirection:
                              DismissDirection.horizontal,
                              isDismissible: true,
                              backgroundColor: MyAppColors.orangcolors,
                              duration: Duration(seconds: 1),
                            );
                            if(snapshot.hasData){
                              manager.isFormSubmit$.listen((event) async{
                                if(Overseer.is_user_valid) {
                                  Get.snackbar(
                                    "Congratulation",
                                    "Successfully LogIn with fitness app",
                                    dismissDirection:
                                    DismissDirection.horizontal,
                                    isDismissible: true,
                                    backgroundColor: MyAppColors.orangcolors,
                                    duration: Duration(seconds: 1),
                                  );
                                  final SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
                                  _sharedPreferences.setInt('userId', Overseer.userId);
                                  // print("${_sharedPreferences.getInt('userId')}");
                                  Get.offAll(Gender());
                                }else if(snapshot.hasError){
                                  Get.snackbar(
                                    "Error",
                                    "Get some Error..",
                                    dismissDirection:
                                    DismissDirection.horizontal,
                                    isDismissible: true,
                                    backgroundColor: MyAppColors.orangcolors,
                                    duration: Duration(seconds: 2),
                                  );
                                }
                              });
                            }else{
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                          },
                          containercolor: Overseer.isColor
                              ? MyAppColors.pickcolor
                              : MyAppColors.orangcolors,
                          textcolor: Colors.white,
                          title: "LogIn".tr);
                    }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(ForgetPassword());
                    },
                    child: Text(
                      "Forget Password".tr,
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
