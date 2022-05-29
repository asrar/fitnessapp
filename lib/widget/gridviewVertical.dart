import 'package:fitnessapp/Utils/appColors.dart';
import 'package:flutter/material.dart';

class GridViewVertical extends StatelessWidget {

  String image,title1, title2;
  GridViewVertical({required this.image, required this.title1 , required this.title2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // width: 171,
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
              title2,
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
