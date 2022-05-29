import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/widget/naseerWidgets/CustomButton.dart';
import 'package:fitnessapp/widget/naseerWidgets/GenderButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'FitnessGoalScreen.dart';

class Gender extends StatefulWidget {
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  late int isselected;
  String isselected_gender = '';

  List<Color> colors = [
    Color(0xffEDA024),
    MyAppColors.pickcolor,
  ];
  List<String> gender = [
    "Male".tr,
    "Female".tr,
  ];
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
        // centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "What is your gender ? ".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Let us help find the best paln for you".tr,
                style: TextStyle(color: Colors.grey[400], letterSpacing: 1),
              ),
              SizedBox(
                height: 60,
              ),

              ///
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 2,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isselected_gender = gender[index];
                          Overseer.gender = isselected_gender;
                          _selected = index;
                          if (index == 0) {
                            Overseer.isColor = false;
                          } else if (index == 1) {
                            Overseer.isColor = true;
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: GenderButton(
                          ontap: () {},

                          color:
                          _selected == index
                              ? Overseer.isColor
                              ? MyAppColors.pickcolor
                              : MyAppColors.orangcolors
                              : Colors.grey,
                          genderText: gender[index],
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: Get.height * 0.3,
              ),
              InkWell(
                onTap: () {
                  print(isselected_gender);
                  print(Overseer.gender);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FitnessGoalScreen()));
                },
                child: CustomButton(
                  color: Overseer.isColor
                      ? MyAppColors.pickcolor
                      : Color(0xffEDA024),
                  buttonName: 'Next'.tr,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
