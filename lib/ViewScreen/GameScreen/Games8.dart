import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/RecomendationScreens/Recmendation8.dart';
import 'package:get/get.dart';
import 'package:fitnessapp/widget/naseerWidgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'Game7.dart';

class Games8 extends StatefulWidget {
  @override
  _Games8State createState() => _Games8State();
}

class _Games8State extends State<Games8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Zombie Run',
          style: TextStyle(color: Colors.black, letterSpacing: 1),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.cancel_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(
                    context, MaterialPageRoute(builder: (context) => Game7()));
              })
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 1.25,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/3.jpg'),
                ),
              ),
              Divider(),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "If you are chased bu zombies, you'll have to speed up!".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              InkWell(
                onTap: () {
                  Get.to(Recmendation8());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: CustomButton(
                    color: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                    buttonName: 'Next',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
