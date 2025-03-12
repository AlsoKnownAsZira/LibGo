
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/home_page/controllers/home_page_controller.dart';
import 'package:venturo_core/shared/styles/color_style.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({
    super.key,
    required this.controller,
  });

  final HomePageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller.searchController,
        decoration: InputDecoration(
          hintText: 'search_books'.tr,
          prefixIcon: const Icon(Icons.search),
         border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
          focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: ColorStyle.purple),
        ),
        ),
      ),
    );
  }
}