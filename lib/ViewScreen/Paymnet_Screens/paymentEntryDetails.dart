import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/filterpage3.dart';
import 'package:fitnessapp/widget/MyButton.dart';
import 'package:fitnessapp/widget/first_name_lastname_textfield.dart';
import 'package:fitnessapp/widget/myTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentEntryDetails extends StatefulWidget {
  final String? total_fee;
  final String? monthly_fee;
  final String? fee_title;

  PaymentEntryDetails(
      {required this.fee_title,
      required this.monthly_fee,
      required this.total_fee});

  @override
  _PaymentEntryDetailsState createState() => _PaymentEntryDetailsState();
}

class _PaymentEntryDetailsState extends State<PaymentEntryDetails> {
  bool? cardcheck = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.011,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: ImageIcon(
                        AssetImage(
                          "assets/image/close.png",
                        ),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.033,
                ),
                Container(
                  width: Get.width * 1,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.5))),
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: MyAppColors.pickcolor,
                        value: this.cardcheck,
                        onChanged: (bool? value) {
                          setState(() {
                            this.cardcheck = value;
                          });
                        },
                      ),
                      Container(
                        width: Get.width * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${widget.fee_title}".tr,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "\$ ${widget.total_fee} billed every 3 mo.".tr,
                              style: TextStyle(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 60,
                        child: Text(
                          "\$ ${widget.monthly_fee}/month ".tr,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.033,
                ),
                Text(
                    "Unlock the secret routines of top athletes with HD video & rep tracking"
                        .tr),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "This email is very important because this email will be register our team Database",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                SizedBox(
                  height: 14,
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextField(
                  errortext: "",
                  onChanged: null,
                  icon: Icons.local_atm,
                  title: "Name on card".tr,
                  obsecure: false,
                ),
                MyTextField(
                  errortext: "",
                  onChanged: null,
                  icon: Icons.attach_money,
                  title: "Card No".tr,
                  obsecure: false,
                ),

                Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: FirstName_lastName_textfield(
                          onChanged: null,
                          errortext: "",
                          obsecure: false,
                          title: "MM",
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 5,
                        child: FirstName_lastName_textfield(
                          onChanged: null,
                          errortext: "",
                          obsecure: false,
                          title: "YY",
                        ))
                  ],
                ),
                MyTextField(
                  errortext: "",
                  onChanged: null,
                  icon: Icons.security,
                  title: "Secority Code".tr,
                  obsecure: false,
                ),

                MyTextField(
                  errortext: "",
                  onChanged: null,
                  icon: Icons.local_post_office,
                  title: "Zip / Portal Code".tr,
                  obsecure: false,
                ),
                // SizedBox(
                //   height: Get.height * 0.070,
                // ),
                MyButton(
                    shadowColor: Colors.grey.withOpacity(0.5),
                    ontap: () {
                      Get.to(FilterPage3());
                    },
                    containercolor: Colors.grey.withOpacity(0.5),
                    textcolor: Colors.white,
                    title: "Complete Order".tr)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
