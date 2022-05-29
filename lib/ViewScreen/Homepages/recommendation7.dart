import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Model/animalClass.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/Paymnet_Screens/PaymentScreen.dart';
import 'package:fitnessapp/widget/MyButton.dart';
import 'package:fitnessapp/widget/recommendationWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Recomandation7 extends StatefulWidget {
  @override
  _Recomandation7State createState() => _Recomandation7State();
}

class _Recomandation7State extends State<Recomandation7> {

  static List<Animal> _animals = [
    Animal(id: 1, name: "Monday"),
    Animal(id: 2, name: "Wednesday"),
    Animal(id: 3, name: "Thursday"),
    Animal(id: 4, name: "Friday"),
    Animal(id: 5, name: "Saturday"),
    Animal(id: 6, name: "Sunday"),
    Animal(id: 7, name: "Monday"),
  ];
  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
      .toList();
  //List<Animal> _selectedAnimals = [];
   List<Animal> _selectedDayName = [];


  int _index = 0;
  int _selected = 0;
  int choiceindex = 0;
  List<String> dayname = [
    "M".tr,
    "T".tr,
    "W".tr,
    "T".tr,
    "F".tr,
    "S".tr,
    "S".tr,
  ];
  List<Color> color = [
    MyAppColors.pickcolor,
    MyAppColors.pickcolor,
    MyAppColors.pickcolor,
    MyAppColors.pickcolor,
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ];
  List<String> gridviewtitle = [
    "Work Out".tr,
    "GYM".tr,
    "Lost Fat".tr,
    "Physiotherapy".tr,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.3,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                      color: Colors.white),
                  child: Container(
                      padding: EdgeInsets.only(left: 25, right: 35),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Container(
                                height: 4,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                                child: Text(
                              "Recommendation".tr,
                              style: TextStyle(fontSize: 20),
                            )),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                children: <Widget>[
                                  MultiSelectBottomSheetField(
                                    initialChildSize: 0.4,
                                    listType: MultiSelectListType.CHIP,
                                    searchable: true,
                                    buttonText: Text("Personal Plan"),
                                    title: Text("Days Name"),
                                    items: _items,
                                    onConfirm: (values) {
                                      setState(() {
                                        // _selectedDayName = values;
                                      });
                                    },
                                    chipDisplay: MultiSelectChipDisplay(
                                      onTap: (value) {
                                        setState(() {
                                          _selectedDayName.remove(value);
                                        });
                                      },
                                    ),
                                  ),
                                  _selectedDayName == null || _selectedDayName.isEmpty
                                      ? Container(
                                      padding: EdgeInsets.all(10),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Select Your Personal Plan",
                                        style: TextStyle(color: Colors.black54),
                                      ))
                                      : Container(
                                    child: Text(_selectedDayName.length.toString()),
                                  ),
                                ],
                              ),
                            ),
                            /// old code ListView.builder
                            // SizedBox(
                            //   height: 20,
                            // ),
                            // Container(
                            //   height: 53,
                            //   child: ListView.builder(
                            //       scrollDirection: Axis.horizontal,
                            //       itemCount: dayname.length,
                            //       itemBuilder: (contex, index) {
                            //         return GestureDetector(
                            //           onTap: () {
                            //             setState(() {
                            //               _selected = index;
                            //             });
                            //           },
                            //           child: Container(
                            //             height: 52,
                            //             width: 37,
                            //             margin:
                            //                 EdgeInsets.symmetric(horizontal: 3),
                            //             decoration: BoxDecoration(
                            //                 border: Border.all(
                            //                     color: _selected == index
                            //                         ? MyAppColors.pickcolor
                            //                         : Colors.grey),
                            //                 borderRadius:
                            //                     BorderRadius.circular(5)),
                            //             child:
                            //                 Center(child: Text(dayname[index])),
                            //           ),
                            //         );
                            //       }),
                            // ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Types of Courses".tr),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 4,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 5,
                                    childAspectRatio: 3,
                                    mainAxisSpacing: 5,
                                  ),
                                  itemBuilder: (contex, index) {
                                    return RecommendationScreenWidget(
                                      ontap: () {
                                        setState(() {
                                          _index = index;
                                        });
                                      },
                                      title: gridviewtitle[index],
                                      containercolor: _index == index
                                          ? MyAppColors.pickcolor
                                          : Colors.white,
                                      bordercolor: _index == index
                                          ? MyAppColors.pickcolor
                                          : Colors.grey,
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text("Tools".tr),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 52,
                              width: double.infinity,
                              child: ListView.builder(
                                  itemCount: 2,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (contex, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          choiceindex = index;
                                        });
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        height: 50,
                                        width: Get.width * 0.38,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color:  choiceindex == index
                                                    ? MyAppColors.pickcolor
                                                    : Colors.grey)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/image/kettlebell.png"),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Text("With Tools".tr)
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            MyButton(
                                shadowColor: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                                ontap: () {
                                  Get.to(PaymentScreen());
                                },
                                containercolor: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                                textcolor: Colors.white,
                                title: "Confirm".tr),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
