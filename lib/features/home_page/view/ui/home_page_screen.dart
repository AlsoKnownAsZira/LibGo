  import 'package:flutter/material.dart';
  import 'package:venturo_core/features/home_page/constants/home_page_assets_constant.dart';
  class HomePageScreen extends StatelessWidget {
    HomePageScreen({Key? key}):super(key: key);

    final assetsConstant = HomePageAssetsConstant();
    @override
    Widget build(BuildContext context) {
      return const Scaffold(
        body: Center(
          child: Text('HomePageScreen USER'),
        ),
      );
    }
  }
    