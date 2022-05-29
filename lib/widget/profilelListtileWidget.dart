import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileLIsttileWidget extends StatelessWidget {
  final String name;
  final IconData icon1, icon2;
  final Function() ontap;

  ProfileLIsttileWidget({required this.ontap, required this.name, required this.icon1, required this.icon2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.050,
      child: GestureDetector(
        onTap: ontap,
        child: Row(
          children: [
            Icon(
              icon1,
              color: Colors.black,
            ),
            SizedBox(
              width: 8,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(
              icon2,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
