import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/constants/image_constants.dart';
import 'package:venturo_core/shared/styles/color_style.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward().then((_) {
      _navigateToNextScreen();
    });
  }

  void _navigateToNextScreen() {
    var box = Hive.box('session');
    bool isLoggedIn = box.get('isLoggedIn', defaultValue: false);

    if (isLoggedIn) {
      bool isAdmin = box.get('isAdmin', defaultValue: false);
      if (isAdmin) {
        Get.offNamed(Routes.crudBooksRoute);
      } else {
        Get.offNamed(Routes.homePageRoute);
      }
    } else {
      Get.offNamed(Routes.boardingRoute);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              Center(
                child: ScaleTransition(
                  scale: _animation,
                  child: const Image(image: AssetImage(ImageConstant.logo)),
                ),
              ),
              const SizedBox(height: 20),
              ScaleTransition(
                scale: _animation,
                child: Text(
                  'splash_welcome'.tr,
                  style: TextStyle(
                    fontFamily: GoogleTextStyle.splash.fontFamily,
                    fontSize: 30.sp,
                    color: ColorStyle.purple,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}