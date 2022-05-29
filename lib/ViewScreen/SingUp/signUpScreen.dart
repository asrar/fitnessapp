import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/AppLayer/Provider.dart';
import 'package:fitnessapp/Change%20Language/localization_service.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/LogIn/siginScreen.dart';
import 'package:fitnessapp/ViewScreen/SingUp/SignUpManager.dart';
import 'package:fitnessapp/widget/MyButton.dart';
import 'package:fitnessapp/widget/buttonIconWithText.dart';
import 'package:fitnessapp/widget/first_name_lastname_textfield.dart';
import 'package:fitnessapp/widget/myTextField.dart';
import 'package:fitnessapp/widget/passwordtext_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'SingnUp_WithGoogle/authentication.dart';
import 'SingnUp_WithGoogle/signIn_with_Goggle_Button.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _selectedLang = LocalizationService.langs.first;

  @override
  Widget build(BuildContext context) {
    SignUpManager manager = Provider.of(context).fetch(SignUpManager);
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
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          )),
                      GestureDetector(
                          onTap: () {
                            Get.to(SignInScreen());
                          },
                          child: Text("Sigin".tr)),
                    ],
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  Text(
                    "Sign up to Fitness".tr,
                    style: TextStyle(fontSize: 36),
                  ),

                  SizedBox(
                    height: 10,
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
                    height: 20,
                  ),

                  // Todo
                  FutureBuilder(
                    future: Authentication.initializeFirebase(context: context),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Some Error!');
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return GoogleSignInButton();
                      }
                      return CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFFF57C00),
                        ),
                      );
                    },
                  ),
                  // ButtonIconWithText(
                  //   shadowColor: Colors.green.withOpacity(0.5),
                  //   ontap: () {},
                  //   textcolor: Colors.black,
                  //   containercolor: Colors.white,
                  //   image: "assets/image/googlewe.png",
                  //   title: "Continue With Google".tr,
                  // ),
                  SizedBox(
                    height: 12,
                  ),
                  ButtonIconWithText(
                      shadowColor: MyAppColors.facecolors,
                      ontap: () {},
                      containercolor: MyAppColors.facecolors,
                      textcolor: Colors.white,
                      image: "assets/image/3689126.png",
                      title: "Continue With Facebook".tr),
                  SizedBox(
                    height: 14,
                  ),
                  // Text("Or".tr),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 5,
                          child: StreamBuilder<String>(
                              stream: manager.firstName$,
                              builder: (context, snapshot) {
                                print("Data :  ${snapshot.hasData}");
                                print("error :  ${snapshot.hasError} ");
                                return FirstName_lastName_textfield(
                                  onChanged: (xyz) {
                                    manager.infirstName.add(xyz);
                                  },
                                  errortext: snapshot.error == null
                                      ? ""
                                      : snapshot.error.toString(),
                                  obsecure: false,
                                  title: "First Name",
                                );
                              })),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          flex: 5,
                          child: StreamBuilder<String>(
                              stream: manager.lastName$,
                              builder: (context, snapshot) {
                                print("Data :  ${snapshot.hasData}");
                                print("error :  ${snapshot.hasError} ");
                                return FirstName_lastName_textfield(
                                  onChanged: (xyz) {
                                    manager.inlastName.add(xyz);
                                  },
                                  errortext: snapshot.error == null
                                      ? ""
                                      : snapshot.error.toString(),
                                  obsecure: false,
                                  title: "Last Name",
                                );
                              }))
                    ],
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  StreamBuilder<Object>(
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
                          title: "xyz@gmail.com".tr,
                        );
                      }),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  StreamBuilder<String>(
                      stream: manager.password$,
                      builder: (context, snapshot) {
                        print("Data :  ${snapshot.hasData}");
                        print("error :  ${snapshot.hasError} ");
                        return MyPassword_TextField(
                          onChanged: (xyz) {
                            manager.inPassword.add(xyz);
                          },
                          errortext: snapshot.error == null
                              ? ""
                              : snapshot.error.toString(),
                          obsecure: true,
                          icon: Icons.lock,
                          title: "Password",
                        );
                      }),

                  //Todo show or hide password
                  // ShowAndHide(),
                  SizedBox(
                    height: Get.height * 0.070,
                  ),
                  StreamBuilder<Object>(
                      stream: manager.isFormValid$,
                      builder: (context, snapshot) {
                        return MyButton(
                            shadowColor: MyAppColors.orangcolors,
                            ontap: () {
                              print("data is ${snapshot.hasData}");
                              print("error is ${snapshot.hasError}");
                              print(" actual data is ${snapshot.data}");
                              if (snapshot.hasData) {
                                print("outside Event");
                                manager.isFormSubmit$.listen((event) {
                                 Center(
                                   child: CircularProgressIndicator(),
                                 );
                                  print("Inside Event");
                                  if (Overseer.is_user_Registered) {
                                    Get.snackbar(
                                      "Congratulation",
                                      "Successfully Registered with fitness app",
                                      dismissDirection:
                                      DismissDirection.horizontal,
                                      isDismissible: true,
                                      backgroundColor: MyAppColors.orangcolors,
                                      duration: Duration(seconds: 1),
                                    );
                                    print("Inside Oveerseer");
                                    Get.to(SignInScreen());
                                  } else {
                                    Get.snackbar("Error", "Get some error");
                                  }
                                  CircularProgressIndicator();
                                });
                              }
                            },
                            containercolor: Overseer.isColor
                                ? MyAppColors.pickcolor
                                : MyAppColors.orangcolors,
                            textcolor: Colors.white,
                            title: "SignUp".tr);
                      }),
                  SizedBox(
                    height: 90,
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
