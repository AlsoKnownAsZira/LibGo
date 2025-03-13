import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:venturo_core/features/home_page/view/components/home_app_bar.dart';
import 'package:venturo_core/shared/widgets/custom_botnav.dart';

class UserReportScreen extends StatelessWidget {
  UserReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('session');
    String userName = box.get('nama', defaultValue: 'User');
    String userAvatar = box.get('avatar', defaultValue: '');
    return Scaffold(
      appBar: AppBar(
        title: HomeAppBar(userName: userName, userAvatar: userAvatar),
      ),
      bottomNavigationBar: CustomBotNav(
        currentIndex: 1,
      ),
      body: Center(
        child: Text('User Report Screen'),
      ),
    );
  }
}
