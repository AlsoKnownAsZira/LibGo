import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/sign_in/view/components/top_clip.dart';
import 'package:venturo_core/shared/styles/color_style.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:venturo_core/shared/widgets/custom_button.dart';
import 'package:venturo_core/shared/widgets/custom_text_field.dart';
import 'package:venturo_core/features/sign_in/controllers/sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final SignInController controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopClip(),
              SizedBox(
                height: 125.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "hello".tr,
                  style: TextStyle(
                    fontFamily: GoogleTextStyle.fw600.fontFamily,
                    fontSize: 50.sp,
                    color: ColorStyle.darkBlack,
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                  controller: controller.emailCtrl,
                  hintText: 'enter_email'.tr,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                  controller: controller.passwordCtrl,
                  hintText: 'enter_password'.tr,
                  isPassword: true,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "forgot_password".tr,
                      style: TextStyle(
                        fontFamily: GoogleTextStyle.fw500.fontFamily,
                        fontSize: 20.sp,
                        color: ColorStyle.darkBlack,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MainButton(
                  onPressed: () {
                    controller.validateForm(context);
                  },
                  text: 'sign_in'.tr,
                  width: Get.width,
                  height: 50.h,
                  textSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 120.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'no_account'.tr,
                    style: TextStyle(
                      fontFamily: GoogleTextStyle.fw500.fontFamily,
                      fontSize: 20.sp,
                      color: ColorStyle.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'sign_up'.tr,
                      style: TextStyle(
                        fontFamily: GoogleTextStyle.fw500.fontFamily,
                        fontSize: 20.sp,
                        color: ColorStyle.purple,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}