import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/MenuScreens/menuScreen.dart';
import 'package:fitnessapp/ViewScreen/BMI/bmiScreen.dart';
import 'package:fitnessapp/widget/ProfileScreenWidgets/build_app_bar.dart';
import 'package:fitnessapp/widget/ProfileScreenWidgets/build_outlined_color_button.dart';
import 'package:fitnessapp/widget/ProfileScreenWidgets/build_text_button.dart';
import 'package:fitnessapp/widget/ProfileScreenWidgets/build_toggle_button.dart';
import 'package:fitnessapp/widget/myTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scale_ruler/flutter_scale_ruler.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  List<String> list2=["KG","LBS"];
  List<String> list1=["CM","FT"];
  int _scaleValueCms = 0;
  int _index=0;
  int _choice= 0;
  double? double12;
  TextEditingController text = TextEditingController();
  // bool isbool=false;
  var title;
  var number12 = 1.0;

  void _setText() {
    setState(() {
      number12 = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'BMI'.tr, actions: []),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.height * 0.03),
          child: Column(
            children: [
              // SizedBox(height: Get.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Height'.tr, style: TextStyle(fontSize: 20)),
                  Container(
                    height: 45,
                    width: Get.width*0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.withOpacity(0.5)
                    ),
                    child: ListView.builder(
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx,index){
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            _index=index;
                          });
                        },
                        child: Container(
                          height: 45,
                          width: Get.width*0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: _index ==index ?Colors.white:Colors.grey.withOpacity(0.1),
                          ),
                          child: Center(child: Text(list1[index])),
                        ),
                      );
                    }),
                  )
                ],
              ),
              SizedBox(height: Get.height * 0.02),
              Column(

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${_scaleValueCms} '.tr,
                        style: const TextStyle(fontSize: 20),
                      ),
                      _index ==0 ? Text("CM"):Text("FT")
                    ],
                  ),
                  ScaleRuler.lengthMeasurement(
                    //todo you can change the max value
                    maxValue:  130,
                    minValue: 1,
                    backgroundColor: Colors.white,
                    sliderActiveColor: const Color(0xFFF57C00),
                    sliderInactiveColor: Colors.grey.shade300,
                    onChanged: (ScaleValue scaleValue) {
                      setState(() {
                        _scaleValueCms = scaleValue.cms!;
                      });
                    },
                  ),
                ],
              ),
              // SizedBox(height: Get.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Weight'.tr, style: TextStyle(fontSize: 20)),
                  Container(
                    height: 45,
                    width: Get.width*0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey.withOpacity(0.5)
                    ),
                    child: ListView.builder(
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx,index){
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                _choice=index;
                              });
                            },
                            child: Container(
                              height: 45,
                              width: Get.width*0.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: _choice ==index ?Colors.white:Colors.grey.withOpacity(0.1),
                              ),
                              child: Center(child: Text(list2[index])),
                            ),
                          );
                        }),
                  ),
                ],
              ),

              ///
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(left: 20),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextFormField(
                  onChanged: (value){
                    title= double.parse(value);
                  },
                  controller: text,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Weight",
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                height: Get.height * 0.26,
                width: double.infinity,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: 150,
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          value: number12,
                          needleColor: Color(0x98F57B00),
                          needleLength: 0.4,
                          enableAnimation: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.033,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTextButton(buttonText: 'Cancel'.tr, onTap: () {
                    // Get.to(MenuScreen());

                  }),
                  buildOutlinedColorButton(
                    textColor: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                      borderColor: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                      containerColor: Overseer.isColor ? MyAppColors.pickcolor.withOpacity(0.2):MyAppColors.orangcolors.withOpacity(0.2),
                      buttonText: 'Start'.tr, onTap: () {
                    _setText();
                    // Get.to(BMI6Screen());
                  })
                ],
              ),
              SizedBox(height: Get.height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
