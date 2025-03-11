import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/constants/image_constants.dart';
import 'package:venturo_core/shared/styles/color_style.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:venturo_core/shared/widgets/custom_button.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final PageController _pageController = PageController();
  final List<Map<String, String>> boardingData = [
    {
      'image': ImageConstant.boarding1,
      'title': 'board_title1'.tr,
      'subtitle': 'board_subtitle1'.tr,
    },
    {
      'image': ImageConstant.boarding2,
      'title': 'board_title2'.tr,
      'subtitle': 'board_subtitle2'.tr,
    },
    {
      'image': ImageConstant.boarding2,
      'title': 'board_title3'.tr,
      'subtitle': 'board_subtitle3'.tr,
    },
  ];

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toInt();
      });
    });
  }

  void _onSkip() {
    Get.offNamed(Routes.signInRoute);
  }

  void _onNext() {
    if (_currentPage < boardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Get.offNamed(Routes.signInRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: boardingData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  height: Get.height * 0.65,
                  color: ColorStyle.grey,
                  child: Image.asset(
                    boardingData[index]['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(boardingData.length, (indicatorIndex) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: _currentPage == indicatorIndex ? 12.0 : 8.0,
                    height: _currentPage == indicatorIndex ? 12.0 : 8.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == indicatorIndex
                          ? ColorStyle.purple
                          : ColorStyle.grey,
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                boardingData[index]['title']!,
                style: TextStyle(
                  fontFamily: GoogleTextStyle.splash.fontFamily,
                  fontSize: 30.sp,
                  color: ColorStyle.darkBlack,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(boardingData[index]['subtitle']!,
                    style: TextStyle(
                      fontFamily: GoogleTextStyle.fw500.fontFamily,
                      fontSize: 20.sp,
                      color: ColorStyle.darkBlack,
                    )),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SecondaryButton(
                      onPressed: _onSkip,
                      text: 'Skip',
                      width: 120.w,
                      height: 50.h,
                      textSize: 20.sp,
                    ),
                    MainButton(
                      onPressed: _onNext,
                      text: 'Next',
                      width: 120.w,
                      height: 50.h,
                      textSize: 20.sp,
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
