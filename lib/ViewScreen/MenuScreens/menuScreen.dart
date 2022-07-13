import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/ViewScreen/Setting/Settings.dart';
import 'package:fitnessapp/ViewScreen/LogIn/siginScreen.dart';
import 'package:fitnessapp/ViewScreen/RecomendationScreens/Recommendation9.dart';
import 'package:fitnessapp/ViewScreen/Statistic/statistics.dart';
import 'package:fitnessapp/ViewScreen/Stop_Watch/stop_watch.dart';
import 'package:fitnessapp/ViewScreen/Timer/timer.dart';
import 'package:fitnessapp/ViewScreen/LogBook/Logbook.dart';
import 'package:fitnessapp/ViewScreen/Profile/ProfileScreen.dart';
import 'package:fitnessapp/ViewScreen/Notification/notificationScreen.dart';
import 'package:fitnessapp/ViewScreen/SingUp/signUpScreen.dart';
import 'package:fitnessapp/ViewScreen/Paymnet_Screens/PaymentScreen.dart';
import 'package:fitnessapp/widget/bottombarcontainer.dart';
import 'package:fitnessapp/widget/profilelListtileWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Barcode/barcode_scan.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () async {
                          setState(() {});
                          final SharedPreferences _sharedPreferences =
                              await SharedPreferences.getInstance();
                          _sharedPreferences.remove("userId");
                          Get.offAll(SignInScreen());
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.grey,
                            ),
                            Text(
                              "LogOut".tr,
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  height: Get.height * 0.1,
                  child: Row(
                    children: [
                      Container(
                        height: Get.height * 0.085,
                        width: 62,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                image: AssetImage("assets/image/3.jfif"),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Hello".tr),
                          Text(Overseer.userName.tr),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.020,
            ),
            Container(
              margin: EdgeInsets.only(left: 11, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileLIsttileWidget(
                    name: "My Account".tr,
                    ontap: () {
                      Get.to(ProfileScreen());
                    },
                    icon1: Icons.person,
                    icon2: Icons.arrow_forward_ios,
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  ProfileLIsttileWidget(
                    name: "Friends".tr,
                    ontap: () {
                      Get.to(ProfileScreen());
                    },
                    icon1: Icons.people,
                    icon2: Icons.arrow_forward_ios,
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  ProfileLIsttileWidget(
                    name: "Massages".tr,
                    ontap: () {
                      Get.to(ProfileScreen());
                    },
                    icon1: Icons.message,
                    icon2: Icons.arrow_forward_ios,
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  ProfileLIsttileWidget(
                    name: "Notification".tr,
                    ontap: () {
                      Get.to(NotificationScreen());
                    },
                    icon1: Icons.notifications_active,
                    icon2: Icons.arrow_forward_ios,
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  ProfileLIsttileWidget(
                    name: "Setting".tr,
                    ontap: () {
                      Get.to(Settings());
                    },
                    icon1: Icons.settings,
                    icon2: Icons.arrow_forward_ios,
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  ProfileLIsttileWidget(
                    name: "Statistic".tr,
                    ontap: () {
                      // Get.to(StatisticsScreen());
                    },
                    icon1: Icons.baby_changing_station_sharp,
                    icon2: Icons.arrow_forward_ios,
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  ProfileLIsttileWidget(
                    name: "Subscriptions".tr,
                    ontap: () {
                      Get.to(PaymentScreen());
                    },
                    icon1: Icons.subscriptions_rounded,
                    icon2: Icons.arrow_forward_ios,
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  ProfileLIsttileWidget(
                    name: "Saved".tr,
                    ontap: () {
                      Get.to(Recommendation9(
                        courseId: "",
                      ));
                    },
                    icon1: Icons.save,
                    icon2: Icons.arrow_forward_ios,
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            // Spacer(),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "Quick Access".tr,
                  style: TextStyle(fontSize: 25),
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                BottomBarCOntainer(
                  title: "BarCode Scan".tr,
                  borderColor: Colors.indigoAccent,
                  containerColor: Colors.indigoAccent.withOpacity(0.1),
                  image: "assets/image/Group 3362.png",
                  ontap: () {
                    Get.to(BarCodeScanScreen());
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                BottomBarCOntainer(
                  title: "Timer".tr,
                  borderColor: Colors.yellow,
                  containerColor: Colors.yellowAccent.withOpacity(0.1),
                  image: "assets/image/09-timer.png",
                  ontap: () {
                    // Get.to(TimerScreen());
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                BottomBarCOntainer(
                  title: "Stop Whatch".tr,
                  borderColor: Colors.red,
                  containerColor: Colors.red.withOpacity(0.1),
                  image: "assets/image/Layer_8_5_.png",
                  ontap: () {
                    Get.to(StopWatchScreen());
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                BottomBarCOntainer(
                  title: "Logbook".tr,
                  borderColor: Colors.green,
                  containerColor: Colors.green.withOpacity(0.1),
                  image: "assets/image/Group 3363.png",
                  ontap: () {
                    Get.to(Logbook());
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                BottomBarCOntainer(
                  title: "BMI".tr,
                  borderColor: Colors.cyanAccent,
                  containerColor: Colors.indigoAccent.withOpacity(0.1),
                  image: "assets/image/weight-scale.png",
                  ontap: () {},
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
