import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/constants/image_constants.dart';
import 'package:venturo_core/shared/styles/color_style.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Image(image: AssetImage(ImageConstant.bgsplash)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(child: Image(image: AssetImage(ImageConstant.logo))),
              const SizedBox(height: 20),
              Text(
                'splash_welcome'.tr,
                style: TextStyle(
                    fontFamily: GoogleTextStyle.splash.fontFamily,
                    fontSize: 30.sp,
                    color: ColorStyle.purple),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
