import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:venturo_core/shared/widgets/custom_botnav.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('session');
    bool isAdmin = box.get('isAdmin', defaultValue: false);
    int currentIndex = isAdmin ? 3 : 2;

    return Scaffold(
      bottomNavigationBar: CustomBotNav(currentIndex: currentIndex),
      body: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}