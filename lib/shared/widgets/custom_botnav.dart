import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/shared/styles/color_style.dart';

class CustomBotNav extends StatefulWidget {
  final int currentIndex;
  CustomBotNav({super.key, required this.currentIndex});

  @override
  State<CustomBotNav> createState() => _CustomBotNavState();
}

class _CustomBotNavState extends State<CustomBotNav> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    var box = Hive.box('session');
    bool isAdmin = box.get('isAdmin', defaultValue: false);

    if (isAdmin) {
      switch (index) {
        case 0:
          Get.offNamed(Routes.crudBooksRoute);
          break;
        case 1:
          Get.offNamed(Routes.crudUsersRoute);
          break;
        case 2:
          Get.offNamed(Routes.adminReportRoute);
          break;
        case 3:
          Get.offNamed(Routes.profileRoute);
          break;
      }
    } else {
      switch (index) {
        case 0:
          Get.offNamed(Routes.homePageRoute);
          break;
        case 1:
          Get.offNamed(Routes.userReportRoute);
          break;
        case 2:
          Get.offNamed(Routes.profileRoute);
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('session');
    bool isAdmin = box.get('isAdmin', defaultValue: false);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: ColorStyle.subtlePurple,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: GNav(
        gap: 8,
        activeColor: ColorStyle.purple,
        color: ColorStyle.semiPurple,
        backgroundColor: ColorStyle.subtlePurple,
        padding: const EdgeInsets.all(16),
        selectedIndex: _selectedIndex,
        onTabChange: onTabTapped,
        tabs: isAdmin
            ? [
                const GButton(
                  icon: Icons.dashboard,
                  text: 'Book Management',
                ),
                const GButton(
                  icon: Icons.manage_accounts,
                  text: 'User Management',
                ),
                const GButton(
                  icon: Icons.summarize,
                  text: 'Order',
                ),
                const GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ]
            : [
                const GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                const GButton(
                  icon: Icons.book,
                  text: 'Order',
                ),
                const GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
      ),
    );
  }
}