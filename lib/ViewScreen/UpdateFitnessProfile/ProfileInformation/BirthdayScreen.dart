import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/widget/naseerWidgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'BodyStatus.dart';

class BirthdayScreen extends StatefulWidget {
  @override
  _BirthdayScreenState createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  ///
  // DateTime _selectedDateTime = DateTime.now();
  DateTime now = DateTime.now();
  String datetime1 = DateFormat("yyyy-M-d").format(DateTime.now());

  // String datetime2 = DateFormat("yyyy-M-d").format(DateTime.now());
  // String strDate = "" ;
  void onBirthdayChange(DateTime birthday) {
    setState(() {
      datetime1 = birthday.toString();
      InkWell() {
        setState(() {
          setState(() {
            datetime1 = now.toString();
          });
        });
      }
      // datetime2 = now.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final birthdayTile = new Material(
      color: Colors.transparent,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CupertinoDateTextBox(
            initialValue: now,
            onDateChange: onBirthdayChange,
            hintText: '',
          ),
        ],
      ),
    );
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
              color: Overseer.isColor
                  ? MyAppColors.pickcolor
                  : MyAppColors.orangcolors,
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 30,
              height: 3,
              color: Overseer.isColor
                  ? MyAppColors.pickcolor
                  : MyAppColors.orangcolors,
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
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "What is your birthday ? ".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Let us help find the best plan for you".tr,
                style: TextStyle(color: Colors.grey[400], letterSpacing: 1),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: Get.height*0.072,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Overseer.isColor
                      ? MyAppColors.pickcolor
                      : MyAppColors.orangcolors,),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: birthdayTile,
              ),
              SizedBox(
                height: Get.height * 0.4,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    Overseer.date_of_birth_string = datetime1;
                    print(Overseer.date_of_birth_string);
                  });
                  if (Overseer.date_of_birth_string != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BodyStatus()));
                  } else {
                    Get.snackbar("Error", "plz select");
                  }
                },
                child: CustomButton(
                  buttonName: 'Next'.tr,
                  color: Overseer.isColor
                      ? MyAppColors.pickcolor
                      : MyAppColors.orangcolors,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Text("DOB ${datetime1.toString()}"),
            ],
          ),
        ),
      ),
    );
  }
}
