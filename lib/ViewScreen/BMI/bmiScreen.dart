import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BMIScreen extends StatefulWidget {

  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {

  List<String> image = [
    "assets/image/male1.png",
    "assets/image/male2.png",
    "assets/image/male3.png",
    "assets/image/male4.png",
    "assets/image/male5.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "BMI".tr,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 329,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: image.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 329,
                        child: Image.asset(image[index]),
                      );
                    }),
              ),
              Container(
                height: 14,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      Colors.yellow.withOpacity(0.8),
                      Colors.yellow.withOpacity(0.7),
                      Colors.yellow.withOpacity(0.6),
                      Colors.yellow.withOpacity(0.5),
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.arrow_drop_up_outlined, color: Colors.orange, size: 40,),
              SizedBox(height: 20,),
              Text("body mass".tr),
              SizedBox(height: 10,),
              Text("26.53 kg".tr,style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 20),),
              SizedBox(height: 6,),
              Text("Overweight".tr),
              SizedBox(height: 10,),
              Divider(height: 3, color: Colors.grey, thickness: 5,),
              SizedBox(height: 15,),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Personal measurement results".tr),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Current BMI".tr,style: TextStyle(color: Colors.grey),),Text("26.53 kg / m2"),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Average healthy BMI".tr,style: TextStyle(color: Colors.grey),),Text("18.5 kg / m2 - 25 kg / m2"),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Health status".tr,style: TextStyle(color: Colors.grey),),Text("Health status"),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Your weight should be".tr,style: TextStyle(color: Colors.grey),),Text("59.28 kg - 80.1 kg"),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Weighted index".tr,style: TextStyle(color: Colors.grey),),Text("14.82 kg / m3"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Divider(height: 3, color: Colors.grey, thickness: 5,),
              SizedBox(height: 15,),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Personal advice".tr),
                    SizedBox(height: 15,),
                    Text("What if you could eat donuts and lose weight? The diet called CICO promises you; An abbreviation for the term calories in, calories out. The principle of the diet is very clear: Eat everything you want, ncluding fast food, and lose weight as long as yo burn more calories than you consume every day. ".tr,style: TextStyle(color: Colors.grey),)
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
