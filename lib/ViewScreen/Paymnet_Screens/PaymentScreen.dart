import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/AppLayer/Provider.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/filterpage3.dart';
import 'package:fitnessapp/ViewScreen/Paymnet_Screens/paymentEntryDetails.dart';
import 'package:fitnessapp/widget/MyButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../StartTrial/TrialManager.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    TrialManager manager = Provider.of(context).fetch(TrialManager);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
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
                        ))
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.022,
                ),
                Container(
                    height: Get.height * 0.1,
                    width: 115,
                    child: Image.asset("assets/image/Group10.png")),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Text(
                  "FITNESS".tr,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  "Any Time Any Where!".tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),

                Text(
                    "Unlock the secret routines of top athletes with HD video & rep tracking"
                        .tr),
                SizedBox(
                  height: Get.height * 0.025,
                ),

                ///
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.5))),
                  child: Row(
                    children: [
                      Radio(
                          value: 2,
                          groupValue: value,
                          onChanged: (int? val) {
                            value = val!;
                            setState(() {});
                          }),
                      Container(
                        width: Get.width * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${Overseer.monthlyPlan["title"]}".tr,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "\$ ${Overseer.monthlyPlan["total_fee"]} billed monthly"
                                  .tr,
                              style: TextStyle(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text("\$${Overseer.monthlyPlan["per_month_fee"]}/month "
                          .tr),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.012,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.5))),
                  child: Row(
                    children: [
                      Radio(
                          value: 3,
                          groupValue: value,
                          onChanged: (int? val) {
                            value = val!;
                            setState(() {});
                          }),
                      Container(
                        width: Get.width * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${Overseer.yearlyPlan["title"]}".tr,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "\$${Overseer.yearlyPlan["total_fee"]} billed yearly"
                                  .tr,
                              style: TextStyle(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text("\$${Overseer.yearlyPlan["per_month_fee"]}/month "
                          .tr),
                    ],
                  ),
                ),

                SizedBox(
                  height: Get.height * 0.012,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.5))),
                  child: Row(
                    children: [
                      Radio(
                          value: 4,
                          groupValue: value,
                          onChanged: (int? val) {
                            value = val!;
                            setState(() {});
                          }),
                      Container(
                        width: Get.width * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${Overseer.quartlyPlan["title"]}".tr,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "\$ ${Overseer.quartlyPlan["total_fee"]} billed every 3 mo."
                                  .tr,
                              style: TextStyle(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        "\$ ${Overseer.quartlyPlan["per_month_fee"]}/month ".tr,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.050,
                ),
                Text("Recurring billing. Cancel anytime".tr),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                MyButton(
                    shadowColor: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                    ontap: () {
                      manager.mainList.listen((event) {
                        Get.snackbar("Message", "${Overseer.freeTrialMessage}");
                      });
                      if (value == 2) {
                        Get.to(PaymentEntryDetails(
                          fee_title: Overseer.monthlyPlan["title"],
                          monthly_fee: Overseer.monthlyPlan["per_month_fee"],
                          total_fee: Overseer.monthlyPlan["total_fee"],
                        ));
                      } else if (value == 3) {
                        Get.to(PaymentEntryDetails(
                          fee_title: Overseer.yearlyPlan["title"],
                          monthly_fee: Overseer.yearlyPlan["per_month_fee"],
                          total_fee: Overseer.yearlyPlan["total_fee"],
                        ));
                      } else if (value == 4) {
                        Get.to(PaymentEntryDetails(
                          fee_title: Overseer.quartlyPlan["title"],
                          monthly_fee: Overseer.quartlyPlan["per_month_fee"],
                          total_fee: Overseer.quartlyPlan["total_fee"],
                        ));

                      } else {
                        Get.to(FilterPage3());
                        // Get.to(PaymentEntryDetails(
                        //   fee_title: "7 day free trial",
                        //   monthly_fee: "00",
                        //   total_fee: "00",
                        // ));

                      }

                    },
                    containercolor: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                    textcolor: Colors.white,
                    title: "Start 7 Day Free Trial".tr)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
