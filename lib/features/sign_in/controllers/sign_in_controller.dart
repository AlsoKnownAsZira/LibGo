import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:venturo_core/shared/controllers/global_controller.dart';

class SignInController extends GetxController {
  static SignInController get to => Get.find();
  final Dio _dio = Dio();
  final Logger logger = Logger();

  /// Form Variable Setting
  var formKey = GlobalKey<FormState>();
  var emailCtrl = TextEditingController();
  var emailValue = "".obs;
  var passwordCtrl = TextEditingController();
  var passwordValue = "".obs;
  var isPassword = true.obs;
  var isRememberMe = false.obs;

  /// Form Password Show
  void showPassword() {
    isPassword.value = !isPassword.value;
  }

  /// Form Validate & Submited
  void validateForm(BuildContext context) async {
    print('validateForm called'); // Debug print
    await GlobalController.to.checkConnection();
    print(
        'Connection status: ${GlobalController.to.isConnect.value}'); // Debug print

    var isValid = formKey.currentState!.validate();
    print('Form is valid: $isValid'); // Debug print
    Get.focusScope!.unfocus();

    if (isValid && GlobalController.to.isConnect.value == true) {
      EasyLoading.show(
        status: 'loading'.tr,
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
      );

      formKey.currentState!.save();
      print('Form saved'); // Debug print
      await _signInWithApi(context);
    } else if (GlobalController.to.isConnect.value == false) {
      Get.toNamed(Routes.noConnectionRoute);
    }
  }

  Future<void> _signInWithApi(BuildContext context) async {
    final url =
        'https://67c6a9bf351c081993fe3162.mockapi.io/libgo/api/v1/users';
    try {
      logger.d('Fetching users from $url');
      final response = await _dio.get(url);
      print('API response status code: ${response.statusCode}'); // Debug print

      if (response.statusCode == 200) {
        final users = response.data as List;
        final user = users.firstWhere(
          (user) =>
              user['email'] == emailCtrl.text &&
              user['password'] == passwordCtrl.text,
          orElse: () => null,
        );

        if (user != null) {
          logger.d('Login successful, userId: ${user['id_user']}');
          _saveSession(user);

          // Show success dialog
          PanaraInfoDialog.show(
            context,
            title: "success".tr,
            message: "login_success".tr,
            buttonText: "OK",
            onTapDismiss: () {
              Get.back();
              // Navigate based on isAdmin status
              if (user['isAdmin']) {
                Get.offAllNamed(Routes.crudBooksRoute);
              } else {
                Get.offAllNamed(Routes.homePageRoute);
              }
            },
            panaraDialogType: PanaraDialogType.success,
            barrierDismissible: false,
          );
        } else {
          logger.w('Login failed, invalid credentials');
          PanaraInfoDialog.show(
            context,
            title: "warning".tr,
            message: "wrong_email_password".tr,
            buttonText: "try_again".tr,
            onTapDismiss: () {
              Get.back();
            },
            panaraDialogType: PanaraDialogType.warning,
            barrierDismissible: false,
          );
        }
      } else {
        logger.w('Failed to fetch users, response: ${response.data}');
        PanaraInfoDialog.show(
          context,
          title: "Warning",
          message: "failed_fetch_users".tr,
          buttonText: "Coba lagi",
          onTapDismiss: () {
            Get.back();
          },
          panaraDialogType: PanaraDialogType.warning,
          barrierDismissible: false,
        );
      }
    } catch (e) {
      logger.e('Login request failed: $e');
      PanaraInfoDialog.show(
        context,
        title: "Error",
        message: "failed_sign_in".tr,
        buttonText: "Coba lagi",
        onTapDismiss: () {
          Get.back();
        },
        panaraDialogType: PanaraDialogType.error,
        barrierDismissible: false,
      );
    } finally {
      EasyLoading.dismiss();
    }
  }

  /// Save session status
  void _saveSession(Map<String, dynamic> userData) {
    var box = Hive.box('session');
    box.put('isLoggedIn', true);
    box.put('email', userData['email']);
    box.put('userId', userData['id_user']);
    box.put('nama', userData['nama']);
    box.put('avatar', userData['avatar']);
    box.put('telp', userData['telp']);
    box.put('isAdmin', userData['isAdmin']);
    box.put('alamat', userData['alamat']);
    box.put('creationDate', userData['createdAt']);
    logger.d('User data stored in Hive box: $userData');
  }
}
