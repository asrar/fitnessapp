import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/ResultQR_Code/resultQRScanCode.dart';
import 'package:fitnessapp/widget/ProfileScreenWidgets/build_app_bar.dart';
import 'package:fitnessapp/widget/ProfileScreenWidgets/build_scan_bar_code_button.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarCodeScanScreen extends StatefulWidget {
  const BarCodeScanScreen({Key? key}) : super(key: key);

  @override
  State<BarCodeScanScreen> createState() => _BarCodeScanScreenState();
}

class _BarCodeScanScreenState extends State<BarCodeScanScreen> {
  String? scanBarcodeResult;

  Future scanBarcode() async {
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );

      if (!mounted) return;

      setState(() {
        scanBarcodeResult = scanResult;
      });
    } on PlatformException {
      return 'Error while scaning bar code'.tr;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(title: 'BarCode Scan'.tr, actions: []),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: Get.height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: scanBarcodeResult == null
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * 0.03),
                Text(
                  scanBarcodeResult == null
                      ? 'Unlock the secret routines of top athletes with HD video & rep tracking'
                          .tr
                      : 'Scan Result'.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
                SizedBox(height: Get.height * 0.03),
                SizedBox(
                  height: Get.height * 0.5,
                  child: scanBarcodeResult == null
                      ? Image.asset('assets/image/barCodeExample.png')
                      : Text(scanBarcodeResult!),
                ),
                scanBarcodeResult == null
                    ? Container()
                    : Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Get.to(resultQRScanCode(
                                url: scanBarcodeResult!,
                              ));
                            },
                            child: Text(
                              "Check Result",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                scanBarcodeResult == null
                    ? scanBarCodeButton(
                        buttonText: 'Scan Bar-code'.tr,
                        onTap: scanBarcode,
                      )
                    : scanBarCodeButton(
                        buttonText: 'Scan Again'.tr,
                        onTap: scanBarcode,
                      ),
                SizedBox(height: Get.height * 0.03),
              ],
            ),
          ),
        ));
  }
}
