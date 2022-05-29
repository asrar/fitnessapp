import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/AppLayer/Provider.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/StartTrial/startScreen.dart';
import 'package:fitnessapp/widget/naseerWidgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../UpdateFitnessProfileManager.dart';

class BodyStatus extends StatefulWidget {
  @override
  _BodyStatusState createState() => _BodyStatusState();
}

class _BodyStatusState extends State<BodyStatus> {
  int heightint = 0;
  int weightint = 0;
  String heightin = '';
  String weightin = '';

  List<String> height = [
    "cm",
    "inch",
  ];
  List<String> wieght = [
    "kg",
    "lbs",
  ];
  int? hieght_index;

  int? wieght_index;

  @override
  Widget build(BuildContext context) {
    UpdateFitnessProfileManager manager =
        Provider.of(context).fetch(UpdateFitnessProfileManager);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            // Navigator.pop(context, MaterialPageRoute(builder: (context) => Signin()));
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
              color: Overseer.isColor
                  ? MyAppColors.pickcolor
                  : MyAppColors.orangcolors,
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
      body: GestureDetector(
        child: SingleChildScrollView(
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
                  "What are you body ? ".tr,
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
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Overseer.isColor
                            ? MyAppColors.pickcolor
                            : MyAppColors.orangcolors,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: Get.width * 0.4,
                        child: TextField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                heightint = int.parse(value);
                                print(
                                    "this is height int ${heightint.toString()}");
                              });
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Height",
                              hintStyle: TextStyle(color: Colors.grey),
                            )),
                      ),
                      SizedBox(
                        width: Get.width * 0.1,
                      ),
                      Container(
                        height: 35,
                        width: Get.width * 0.3,
                        child: ListView.builder(
                            itemCount: 2,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    heightin = height[index];
                                    print("this is height in ${heightin}");
                                    hieght_index = index;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  margin: EdgeInsets.symmetric(horizontal: 6),
                                  width: Get.width * 0.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: hieght_index == index
                                        ? Overseer.isColor
                                            ? MyAppColors.pickcolor
                                            : MyAppColors.orangcolors
                                        : Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      height[index],
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Overseer.isColor
                            ? MyAppColors.pickcolor
                            : MyAppColors.orangcolors,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: Get.width * 0.4,
                        child: TextField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                weightint = int.parse(value);
                                print(
                                    " this is wieght int ${weightint.toString()}");
                              });
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Wieght",
                              hintStyle: TextStyle(color: Colors.grey),
                            )),
                      ),
                      SizedBox(
                        width: Get.width * 0.1,
                      ),
                      Container(
                        height: 35,
                        width: Get.width * 0.3,
                        child: ListView.builder(
                            itemCount: 2,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    weightin = wieght[index];
                                    print("this is weight in${weightin}");
                                    wieght_index = index;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  margin: EdgeInsets.symmetric(horizontal: 6),
                                  width: Get.width * 0.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),

                                    /// ternorry operator
                                    color: wieght_index == index
                                        ? Overseer.isColor
                                        ? MyAppColors.pickcolor
                                        : MyAppColors.orangcolors
                                        : Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      wieght[index],
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
                // Text(heightin.toString()),
                // Text(weightin.toString()),
                SizedBox(
                  height: Get.height * 0.3,
                ),
                StreamBuilder<Object>(
                    stream: manager.mainList,
                    builder: (context, snapshot) {
                      return InkWell(
                          onTap: () {
                            Overseer.weight = weightint;
                            Overseer.height = heightint;
                            Overseer.weighttin = weightin;
                            Overseer.heightin = heightin;
                            print(heightin.toString());
                            print(weightin.toString());
                            print(heightint.toString());
                            print(weightint.toString());
                            print("outside Event");
                            manager.mainList.listen((event) {
                              print("Inside Event");
                              if (Overseer.is_Profile_updated) {
                                print("Inside Oveerseer");
                                Get.offAll(StartScreen());
                                Get.snackbar("Cong", "Success");
                              } else {
                                Get.snackbar("Error", "Get some error");
                              }
                            });
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => StartScreen()));
                          },
                          child: CustomButton(
                            buttonName: 'Save'.tr,
                            color: Overseer.isColor
                                ? MyAppColors.pickcolor
                                : MyAppColors.orangcolors,
                          ));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
