// import 'package:fitnessapp/Utils/appColors.dart';
// import 'package:fitnessapp/ViewScreen/LogBook/Logbook.dart';
// import 'package:fitnessapp/widget/naseerWidgets/CustomButton.dart';
// import 'package:fitnessapp/widget/naseerWidgets/FlutterSwitchWidget.dart';
// import 'package:fitnessapp/widget/naseerWidgets/SlidingSwitchWidget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_multiselect/flutter_multiselect.dart';
// import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
// import 'package:get/get.dart';
//
// import 'nameModel.dart';
//
// class Recommendation9 extends StatefulWidget {
//   // String _title;
//   // TimeOfDay _timeOfDay;
//   // Function _updateTimeFunction;
//   // Recommendation9(this._title, this._timeOfDay, this._updateTimeFunction);
//   @override
//   _Recommendation9State createState() => _Recommendation9State();
// }
//
// class _Recommendation9State extends State<Recommendation9> {
//   int _selected = 0;
//   List<String> dayname = [];
//   late String _title;
//   late TimeOfDay _timeOfDay;
//   late Function _updateTimeFunction;
//
//   DateTime _dateTime = DateTime.now();
//
//   // Recommendation9(this._title, this._timeOfDay, this._updateTimeFunction);
//   List<ContactModel> contacts = [
//     ContactModel("Monday", false),
//     ContactModel("Tuesday", false),
//     ContactModel("Wensday", false),
//     ContactModel("Thursday", false),
//     ContactModel("Friday", false),
//     ContactModel("Saturday", false),
//     ContactModel("Monday", false),
//   ];
//
//   List<ContactModel> selectedContacts = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       body: Column(
//         children: [
//           SizedBox(
//             height: Get.height * 0.32,
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(60),
//                     topRight: Radius.circular(60))),
//             height: MediaQuery.of(context).size.height * 0.68,
//             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//             child: SingleChildScrollView(
//               physics: BouncingScrollPhysics(),
//               child: Column(
//                 children: [
//                   Container(
//                     height: 3,
//                     width: 50,
//                     color: Colors.grey[300],
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Time',
//                           style: TextStyle(
//                               letterSpacing: 1,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20),
//                         ),
//                       ],
//                     ),
//                   ),
//                   TimePickerSpinner(
//                     is24HourMode: false,
//                     itemWidth: 40,
//                     time: DateTime.now(),
//                     normalTextStyle: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blueGrey),
//                     highlightedTextStyle: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black),
//                     spacing: 50,
//                     itemHeight: 80,
//                     isForce2Digits: true,
//                     onTimeChange: (time) {
//                       setState(() {
//                         _dateTime = time;
//                       });
//                     },
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Personal plan".tr,
//                           style: TextStyle(
//                               letterSpacing: 1, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: 53,
//                     child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: dayname.length,
//                         itemBuilder: (contex, index) {
//                           return GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 _selected = index;
//                               });
//                             },
//                             child: Container(
//                               height: 52,
//                               width: Get.width * 0.115,
//                               margin: EdgeInsets.symmetric(horizontal: 3),
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: _selected == index
//                                           ? MyAppColors.pickcolor
//                                           : Colors.grey),
//                                   borderRadius: BorderRadius.circular(5)),
//                               child: Center(child: Text(dayname[index],style: TextStyle(color: Colors.black),)),
//                             ),
//                           );
//                         }),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   // Container(
//                   //   padding: EdgeInsets.symmetric(horizontal: 15),
//                   //   child: GridView.builder(
//                   //       shrinkWrap: true,
//                   //       physics: NeverScrollableScrollPhysics(),
//                   //       itemCount: contacts.length,
//                   //       // scrollDirection: Axis.horizontal,
//                   //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   //           crossAxisCount: 3,
//                   //           childAspectRatio: 1,
//                   //           // crossAxisSpacing: 10,
//                   //           mainAxisExtent: 25,
//                   //           mainAxisSpacing: 10
//                   //       ),
//                   //       itemBuilder: (contex, index) {
//                   //         return contactItem(
//                   //           contacts[index].name,
//                   //           contacts[index].isSelected,
//                   //           index,
//                   //         );
//                   //       }),
//                   // ),
//                   Container(
//                     margin: EdgeInsets.only(left: 15, right: 15, top: 20),
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(5)),
//                         border: Border.all(color: Colors.grey)),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Received notification'.tr,
//                               style: TextStyle(color: Colors.grey[300]),
//                             ),
//                             Text(
//                               'Enabled',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                         FlutterSwitchWidget(
//                           status: false,
//                         )
//                       ],
//                     ),
//                   ),
//
//                   SizedBox(
//                     height: Get.height * 0.04,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       print(selectedContacts.length);
//                       print("all data of the selcetd ${selectedContacts}");
//                       // Navigator.push(context,
//                       //     MaterialPageRoute(builder: (context) => Logbook()));
//                     },
//                     child: CustomButton(
//                       buttonName: 'Save'.tr,
//                       color: Color(0xffFF69BF),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//
//
//
//
//
//
//   Widget contactItem(String name, bool isSelected, int index) {
//     return InkWell(
//       onTap: () {
//         setState(() {
//           contacts[index].isSelected = !contacts[index].isSelected;
//           if (contacts[index].isSelected == true) {
//             selectedContacts.add(ContactModel(name, true));
//           } else if (contacts[index].isSelected == false) {
//             selectedContacts
//                 .removeWhere((element) => element.name == contacts[index].name);
//           }
//         });
//       },
//       child: Row(
//         children: [
//           Text(
//             name,
//             style: TextStyle(
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           isSelected
//               ? Icon(
//                   Icons.check_circle,
//                   color: Colors.green[700],
//                 )
//               : Icon(
//                   Icons.check_circle_outline,
//                   color: Colors.grey,
//                 ),
//         ],
//       ),
//     );
//   }
// }
//Todo: Real project code the above code just try
import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/AppLayer/Provider.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/LogBook/Logbook.dart';
import 'package:fitnessapp/ViewScreen/RecomendationScreens/AddCourseSchedule/addcoursesScheduleModel.dart';
import 'package:fitnessapp/widget/naseerWidgets/CustomButton.dart';
import 'package:fitnessapp/widget/naseerWidgets/FlutterSwitchWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';

import 'AddCourseSchedule/addCoourseScheduleManager.dart';

class Recommendation9 extends StatefulWidget {
  // String _title;
  // TimeOfDay _timeOfDay;
  // Function _updateTimeFunction;
  // Recommendation9(this._title, this._timeOfDay, this._updateTimeFunction);
  @override
  _Recommendation9State createState() => _Recommendation9State();
  final String courseId;
  Recommendation9({required this.courseId});
}

class _Recommendation9State extends State<Recommendation9> {
  int _selected = 0;
  // List<String> dayname = [
  //   "M".tr,
  //   "T".tr,
  //   "W".tr,
  //   "T".tr,
  //   "F".tr,
  //   "S".tr,
  //   "S".tr,
  // ];
  // late String _title;
  // late TimeOfDay _timeOfDay;
  // late Function _updateTimeFunction;

  DateTime _dateTime = DateTime.now();
  bool day1 = false;
  bool day2 = false;
  bool day3 = false;
  bool day4 = false;
  bool day5 = false;
  bool day6 = false;
  bool day7 = false;
  int day1int = 0;
  int day2int = 0;
  int day3int = 0;
  int day4int = 0;
  int day5int = 0;
  int day6int = 0;
  int day7int = 0;

  // Recommendation9(this._title, this._timeOfDay, this._updateTimeFunction);
  @override
  Widget build(BuildContext context) {
    AddCoursesScheduleManager manager =
        Provider.of(context).fetch(AddCoursesScheduleManager);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.32,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60))),
            height: MediaQuery.of(context).size.height * 0.68,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: 3,
                    width: 50,
                    color: Colors.grey[300],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Time',
                          style: TextStyle(
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  TimePickerSpinner(
                    is24HourMode: false,
                    itemWidth: 40,
                    time: DateTime.now(),
                    normalTextStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                    highlightedTextStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                    spacing: 50,
                    itemHeight: 80,
                    isForce2Digits: true,
                    onTimeChange: (time) {
                      setState(() {
                        _dateTime = time;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Personal plan".tr,
                          style: TextStyle(
                              letterSpacing: 1, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            day1int = 1;
                            day1 = !day1;
                          });
                        },
                        child: Container(
                          height: 52,
                          width: Get.width * 0.108,
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: day1
                                      ? Overseer.isColor
                                          ? MyAppColors.pickcolor
                                          : MyAppColors.orangcolors
                                      : Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(child: Text("M")),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            day2int = 1;
                            day2 = !day2;
                          });
                        },
                        child: Container(
                          height: 52,
                          width: Get.width * 0.108,
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: day2
                                      ? Overseer.isColor
                                          ? MyAppColors.pickcolor
                                          : MyAppColors.orangcolors
                                      : Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(child: Text("T")),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            day3int = 1;
                            day3 = !day3;
                          });
                        },
                        child: Container(
                          height: 52,
                          width: Get.width * 0.108,
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: day3
                                      ? Overseer.isColor
                                          ? MyAppColors.pickcolor
                                          : MyAppColors.orangcolors
                                      : Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(child: Text("W")),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            day4int = 1;
                            day4 = !day4;
                          });
                        },
                        child: Container(
                          height: 52,
                          width: Get.width * 0.108,
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: day4
                                      ? Overseer.isColor
                                          ? MyAppColors.pickcolor
                                          : MyAppColors.orangcolors
                                      : Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(child: Text("T")),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            day5int = 1;
                            day5 = !day5;
                          });
                        },
                        child: Container(
                          height: 52,
                          width: Get.width * 0.108,
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: day5
                                      ? Overseer.isColor
                                          ? MyAppColors.pickcolor
                                          : MyAppColors.orangcolors
                                      : Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(child: Text("F")),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            day6int = 1;
                            day6 = !day6;
                          });
                        },
                        child: Container(
                          height: 52,
                          width: Get.width * 0.108,
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: day6
                                      ? Overseer.isColor
                                          ? MyAppColors.pickcolor
                                          : MyAppColors.orangcolors
                                      : Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(child: Text("S")),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            day7int = 1;
                            day7 = !day7;
                          });
                        },
                        child: Container(
                          height: 52,
                          width: Get.width * 0.108,
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: day7
                                      ? Overseer.isColor
                                          ? MyAppColors.pickcolor
                                          : MyAppColors.orangcolors
                                      : Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(child: Text("S")),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Received notification'.tr,
                              style: TextStyle(color: Colors.grey[300]),
                            ),
                            Text(
                              'Enabled',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            FlutterSwitchWidget(
                              status: false,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.050,
                  ),
                  StreamBuilder<List<AddCourseScheduleModel>>(
                      stream: manager.mainList,
                      builder: (context, snapshot) {
                        return InkWell(
                          onTap: () {
                            print("Outside Event");
                            Overseer.scheduleQuery = "";
                            Overseer.scheduleQuery =
                                "course_id=${widget.courseId}&sun=${day7int}&mon=${day1int}&tue=${day2int}&wed=${day4int}&thu=${day5int}&fri=${day6int}&sat=${day6int}";
                            print(" querry this one${Overseer.scheduleQuery}");
                            manager.mainList.listen((event) {
                              print("Inside Event");
                              if (Overseer.isOngoingSuccess) {
                                print("Inside Oveerseer");
                                Get.snackbar("Thanks",
                                    " Your course has been registered",
                                    backgroundColor: MyAppColors.orangcolors);
                                Get.to(Logbook());
                              } else {
                                Get.snackbar("Error", "Get some error");
                              }
                            });

                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => Logbook()));
                          },
                          child: CustomButton(
                            buttonName: 'Save'.tr,
                            color: Overseer.isColor
                                ? MyAppColors.pickcolor
                                : MyAppColors.orangcolors,
                          ),
                        );
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
