  import 'package:flutter/material.dart';
import 'package:venturo_core/shared/widgets/custom_botnav.dart';
  class CrudUsersScreen extends StatelessWidget {
    CrudUsersScreen({Key? key}):super(key: key);

    @override
    Widget build(BuildContext context) {
      return  Scaffold(
                bottomNavigationBar: CustomBotNav(currentIndex: 1,),

        body: Center(
          child: Text('Crud Users Screen'),
        ),
      );
    }
  }
    