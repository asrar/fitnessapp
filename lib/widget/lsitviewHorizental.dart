import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListViewHorizental extends StatelessWidget {

  String image,percent,title1, title2;
  ListViewHorizental({required this.image, required this.percent, required this.title1 , required this.title2});
///
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.15,
      width: 171,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: NetworkImage(image),fit: BoxFit.cover,
          ),
          borderRadius:
          BorderRadius
              .circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Get.height*0.030,
            width: 40,
            margin: EdgeInsets.only(left: 10,top: Get.height*0.005),
            decoration: BoxDecoration(
              color: Overseer.isColor
                  ? MyAppColors.pickcolor
                  : MyAppColors.orangcolors,
              borderRadius: BorderRadius.circular(5)
            ),
            child: Center(
              child: Text(
                percent,
                style: TextStyle(
                    color: Colors.white,fontSize: 20),
              ),
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 10,),
            child: Text(
              title1,
              style: TextStyle(
                  color:
                  Colors.white,
                  fontWeight:
                  FontWeight
                      .bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10,),
            child: Text(
              title2,maxLines: 2,
              style: TextStyle(
                  color:
                  Colors.white,
                  fontWeight:
                  FontWeight
                      .bold),
            ),
          ),
        ],
      ),
    );
  }
}
