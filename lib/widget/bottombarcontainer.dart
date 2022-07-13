import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarCOntainer extends StatelessWidget {
  final String title;
  final Color containerColor;
  final Color borderColor;
  final String image;
  final Function() ontap;
  BottomBarCOntainer(
      {required this.ontap,
      required this.image,
      required this.title,
      required this.borderColor,
      required this.containerColor});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: Get.width * 0.09,
        child: Column(
          children: [
            Container(
              height: Get.width * 0.09,
              width: Get.width * 0.09,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: borderColor,
                  ),
                  color: containerColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(image),
                )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 2,
            ),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 7),
            ),
          ],
        ),
      ),
    );
  }
}
