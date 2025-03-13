import 'package:flutter/material.dart';
import 'package:venturo_core/shared/widgets/custom_botnav.dart';

class UserReportScreen extends StatelessWidget {
  UserReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBotNav(
        currentIndex: 1,
      ),
      body: Center(
        child: Text('User Report Screen'),
      ),
    );
  }
}
