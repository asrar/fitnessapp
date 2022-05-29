import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/widget/MyButton.dart';
import 'package:fitnessapp/widget/rowWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Barcode/barcode_scan.dart';

class resultQRScanCode extends StatefulWidget {
  String url;

  resultQRScanCode({required this.url});

  @override
  _resultQRScanCodeState createState() => _resultQRScanCodeState();
}

class _resultQRScanCodeState extends State<resultQRScanCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        )),
                    Text(
                      "ketchup".tr,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(BarCodeScanScreen());
                      },
                      icon: ImageIcon(
                        AssetImage("assets/image/barcode.png"),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 55,
                ),
                Container(
                  height: 181,
                  width: 181,
                  child: Image.asset("assets/image/ketchup.png"),
                ),
                SizedBox(
                  height: 24,
                ),
                Text("119 calories".tr),
                SizedBox(
                  height: 26,
                ),
                Text(
                  "100 grams of this food represents an energy value of 119 calories or calories (or 505 kilojoules)."
                      .tr,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 17,
                ),
                RowWidget(
                  title1: "QR Code Result:".tr,
                  title2: widget.url.tr,
                ),
                SizedBox(
                  height: 17,
                ),
                RowWidget(
                  title1: "protein".tr,
                  title2: "2,3 grams".tr,
                ),
                SizedBox(
                  height: 17,
                ),
                RowWidget(
                  title1: "Carbohydrates".tr,
                  title2: "26.6 grams".tr,
                ),
                SizedBox(
                  height: 17,
                ),
                RowWidget(
                  title1: "Sugars".tr,
                  title2: "18.318.3 grams".tr,
                ),
                SizedBox(
                  height: 17,
                ),
                RowWidget(
                  title1: "Fats".tr,
                  title2: "0,1 grams".tr,
                ),
                SizedBox(
                  height: 17,
                ),
                RowWidget(
                  title1: "Water".tr,
                  title2: "66 grams".tr,
                ),
                SizedBox(
                  height: 20,
                ),
                MyButton(
                    shadowColor: MyAppColors.pickcolor,
                    ontap: () {},
                    containercolor: MyAppColors.pickcolor,
                    textcolor: Colors.white,
                    title: "Again Check Your Result")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
