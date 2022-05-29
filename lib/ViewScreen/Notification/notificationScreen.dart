
import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/widget/MyButton.dart';
import 'package:fitnessapp/widget/naseerWidgets/ThemeContainer.dart';
import 'package:fitnessapp/widget/notification_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool status = false;
  bool status1 = false;
  bool status2 = false;
//  final _controller04 = AdvancedSwitchController();
 // final _controller02 = AdvancedSwitchController();
 // final _controller05 = AdvancedSwitchController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Notification Settings".tr,
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 57,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [],
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.5))),
                  child: ListTile(
                    title: Text("Receive notifications".tr),
                    trailing: AdvancedSwitch(
                      activeChild: Text('ON'),
                      inactiveChild: Text('OFF'),
                      borderRadius: BorderRadius.circular(5),
                      width: 76,
                    //  controller: _controller02,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.5))),
                  child: ListTile(
                    title: Text("Receive newsletters".tr),
                    trailing: AdvancedSwitch(
                      activeChild: Text('ON'),
                      inactiveChild: Text('OFF'),
                      borderRadius: BorderRadius.circular(5),
                      width: 76,
                    //  controller: _controller04,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.5))),
                  child: ListTile(
                    title: Text("Receive special offers".tr),
                    trailing: AdvancedSwitch(
                      activeChild: Text('ON'),
                      inactiveChild: Text('OFF'),
                      borderRadius: BorderRadius.circular(5),
                      width: 76,
                   //   controller: _controller05,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.3,
                ),
                MyButton(
                    shadowColor: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                    ontap: () {},
                    containercolor: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                    textcolor: Colors.white,
                    title: "Save".tr)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
