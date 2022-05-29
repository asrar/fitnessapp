import 'package:better_player/better_player.dart';
import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/Homepages/homepage1.dart';
import 'package:fitnessapp/widget/MyButton.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  BetterPlayerController? _betterPlayerController;
  BetterPlayerDataSource? _betterPlayerDataSource;
  static const IconData stop_circle_outlined = IconData(0xf3e9,);

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      autoDetectFullscreenDeviceOrientation: true,
      autoPlay: true,
      looping: true,
    );
    _betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      "${Overseer.course_image_path}/${Overseer.videoURL}",
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController!.setupDataSource(_betterPlayerDataSource!);
    // TODO: implement initState
    super.initState();
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
    // rawData.forEach((element) {
    //   Data.add(ModelClass.fromJson(element));
    // });
  }
  // _betterPlayerController!.dispose();


  bool isselected = false;
  late DateTime curent;
  /// show only Toast and exit the app
  Future<bool> popped() {
    DateTime now = DateTime.now();
    if (curent == null || now.difference(curent) > Duration(seconds: 2)) {
      curent = now;
      Fluttertoast.showToast(
        textColor: Colors.black,
        msg: "Press Back Button Again To Exit",
        toastLength: Toast.LENGTH_SHORT,
      );
      return Future.value(false);
    } else {
      Fluttertoast.cancel();
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope( onWillPop: popped,child: Scaffold(
      body: isselected
          ? Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/male.jfif"),
                fit: BoxFit.cover)),
        // width: double.infinity,
        // height: Get.height,
        child: Column(
          children: [
            SizedBox(height: Get.height*0.17,),
            Container(
              height: Get.height*0.3,
              width: double.infinity,
              child: BetterPlayer(controller: _betterPlayerController!),
            ),

            SizedBox(
              height: Get.height * 0.05,
            ),
            MyButton(
                shadowColor: MyAppColors.pickcolor,
                ontap: () {
                  Get.to(HomePage1());
                },
                containercolor: MyAppColors.pickcolor,
                textcolor: Colors.white,
                title: "Skip tutorial"),
          ],
        ),
      )
          : Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/male.jfif"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black54,
                  border: Border.all(color: Colors.white, width: 2)),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isselected = !isselected;
                  });
                },
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Text(
              Overseer.videoCaption.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            MyButton(
                shadowColor: MyAppColors.pickcolor,
                ontap: () {
                  Get.to(HomePage1());
                },
                containercolor: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                textcolor: Colors.white,
                title: "Skip tutorial")
          ],
        ),
      ),
    ));
  }
}
