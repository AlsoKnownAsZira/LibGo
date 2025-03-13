  import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:venturo_core/shared/widgets/custom_botnav.dart';
  class AdminReportScreen extends StatelessWidget {
    AdminReportScreen({Key? key}):super(key: key);

    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        bottomNavigationBar: CustomBotNav(currentIndex: 2,),
        body: Center(
          child: Text('Admin Report Screen'),
        ),
      );
    }
  }
    