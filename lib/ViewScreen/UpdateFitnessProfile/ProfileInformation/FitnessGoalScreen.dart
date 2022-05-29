import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/widget/naseerWidgets/CustomButton.dart';
import 'package:fitnessapp/widget/naseerWidgets/GenderButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'BirthdayScreen.dart';

class FitnessGoalScreen extends StatefulWidget {
  @override
  _FitnessGoalScreenState createState() => _FitnessGoalScreenState();
}

class _FitnessGoalScreenState extends State<FitnessGoalScreen> {
  int fitnessfoal_selected_id = 0;
  String fitnessfoal_selected_name = "";

  int isselected = 0;

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
                    'Sign',
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sans'),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "What is your fitness goal ? ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Let us help find the best plan for you",
                style: TextStyle(color: Colors.grey[400], letterSpacing: 1),
              ),
              SizedBox(
                height: 40,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: Overseer.fitnessGoalMap.length,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isselected = index;
                          fitnessfoal_selected_id =
                              Overseer.fitnessGoalMap.values.elementAt(index);
                          fitnessfoal_selected_name =
                              Overseer.fitnessGoalMap.keys.elementAt(index);
                          Overseer.fitnesgoal_id = fitnessfoal_selected_id;
                          Overseer.fitnesgoal_name = fitnessfoal_selected_name;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: GenderButton(
                          ontap: () {
                            setState(() {
                              print("this is for tsting");
                            });
                          },
                          color: isselected == index
                              ? Overseer.isColor
                              ? MyAppColors.pickcolor
                              : MyAppColors.orangcolors
                              : Colors.grey,
                          genderText:
                              Overseer.fitnessGoalMap.keys.elementAt(index),
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: Get.height * 0.1,
              ),
              InkWell(
                onTap: () {
                  print(isselected.toString());
                  print(Overseer.fitnesgoal_name);
                  print("fitness goal id" + "${Overseer.fitnesgoal_id}");
                  Get.to(BirthdayScreen());
                },
                child: CustomButton(
                  color: Overseer.isColor
                      ? MyAppColors.pickcolor
                      : MyAppColors.orangcolors,
                  buttonName: 'Next',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
