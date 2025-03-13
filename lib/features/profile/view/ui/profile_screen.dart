import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:venturo_core/constants/image_constants.dart';
import 'package:venturo_core/shared/styles/color_style.dart';
import 'package:venturo_core/shared/widgets/custom_botnav.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('session');
    bool isAdmin = box.get('isAdmin', defaultValue: false);
    int currentIndex = isAdmin ? 3 : 2;
    String welcome = isAdmin ? 'welcome_admin'.tr : 'welcome_user'.tr;
    String working = isAdmin ? 'working_admin'.tr : 'working_user'.tr;

    // Formatting tanggal
    String creationDate = box.get('creationDate', defaultValue: '0');
    DateTime parsedDate = DateTime.parse(creationDate);
    String formattedDate = DateFormat('dd-MM-yyyy').format(parsedDate);

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: const Color.fromARGB(133, 0, 0, 0),
            height: 1.0,
          ),
        ),
        title: Text(
          'profile'.tr,
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 30.sp,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomBotNav(currentIndex: currentIndex),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage:
                    NetworkImage(box.get('avatar', defaultValue: '')),
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'hello_profile'.tr,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: box.get('nama', defaultValue: 'User') + '👋',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: ColorStyle.purple,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text("User ID: ${box.get('userId', defaultValue: '0')}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: Colors.black,
                )),
            Text("$working: $formattedDate",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: Colors.black,
                )),
            // const SizedBox(height: 10),
            Text(welcome,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: ColorStyle.purple,
                )),

            SizedBox(
              height: 50.h,
            ),
            ListTile(
              tileColor: ColorStyle.subtlePurple,
              leading: Image.asset(ImageConstant.profile),
              title: Text(box.get('nama', defaultValue: 'User'),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: ColorStyle.purple,
                  )),
              subtitle: Text('name'.tr),
              trailing: Image.asset(ImageConstant.arrow),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              tileColor: ColorStyle.subtlePurple,
              leading: Image.asset(ImageConstant.location),
              title: Text(box.get('alamat', defaultValue: 'Earth'),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: ColorStyle.purple,
                  )),
              subtitle: Text('address'.tr),
              trailing: Image.asset(ImageConstant.arrow),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              tileColor: ColorStyle.subtlePurple,
              leading: Image.asset(ImageConstant.telephone),
              title: Text(box.get('telp', defaultValue: '123'),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: ColorStyle.purple,
                  )),
              subtitle: Text('phone'.tr),
              trailing: Image.asset(ImageConstant.arrow),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              tileColor: ColorStyle.subtlePurple,
              leading: Image.asset(ImageConstant.email),
              title: Text(box.get('email', defaultValue: '123'),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: ColorStyle.purple,
                  )),
              subtitle: Text('email'.tr),
              trailing: Image.asset(ImageConstant.arrow),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              tileColor: ColorStyle.subtlePurple,
              leading: const Icon(
                Icons.rule,
                color: ColorStyle.purple,
              ),
              title: Text("privacy_policy".tr,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: ColorStyle.purple,
                  )),
              subtitle: Text('check_privacy'.tr),
              trailing: Image.asset(ImageConstant.arrow),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        height: MediaQuery.of(context).size.height * 0.75,
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Privacy Policy"),
                            const SizedBox(height: 8),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                ),
                                child: InAppWebView(
                                  initialUrlRequest: URLRequest(
                                    url: WebUri('https://venturo.id'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              tileColor: ColorStyle.subtlePurple,
              leading: const Icon(
                Icons.language,
                color: ColorStyle.purple,
              ),
              title: Text("change_language".tr,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: ColorStyle.purple,
                  )),
              subtitle: Text('change_language_tapped'.tr),
              trailing: Image.asset(ImageConstant.arrow),
            ),
          ],
        ),
      ),
    );
  }
}
