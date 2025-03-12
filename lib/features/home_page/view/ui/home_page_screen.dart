import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:venturo_core/features/home_page/constants/home_page_assets_constant.dart';
import 'package:venturo_core/shared/controllers/global_controller.dart';
import 'package:venturo_core/shared/styles/color_style.dart';
import 'package:venturo_core/features/home_page/view/components/home_app_bar.dart';
class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key}) : super(key: key);

  final assetsConstant = HomePageAssetsConstant();
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('session');
    String userName = box.get('nama', defaultValue: 'User');
    String userAvatar = box.get('avatar', defaultValue: '');

    return Scaffold(
      appBar: AppBar(
       
        title: HomeAppBar(userName: userName, userAvatar: userAvatar),
      ),
      body: Center(
        child: Text('HomePageScreen USER'),
      ),
    );
  }
}

