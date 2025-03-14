  import 'package:flutter/material.dart';
import 'package:get/get.dart';
  import 'package:venturo_core/features/crud_books/constants/crud_books_assets_constant.dart';
import 'package:venturo_core/shared/controllers/global_controller.dart';
import 'package:venturo_core/shared/widgets/custom_botnav.dart';
  class CrudBooksScreen extends StatelessWidget {
    CrudBooksScreen({Key? key}):super(key: key);

    final assetsConstant = CrudBooksAssetsConstant();
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
                bottomNavigationBar: CustomBotNav(currentIndex: 0,),

        body: Center(
          child: ElevatedButton(onPressed: (){
             Get.find<GlobalController>().signOut();
          }, child: Text('signout from crud books')),
        ),
      );
    }
  }
    