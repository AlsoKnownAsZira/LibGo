import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/home_page/models/books.dart';
import 'package:venturo_core/shared/controllers/global_controller.dart';
import 'package:venturo_core/shared/styles/color_style.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.userName,
    required this.userAvatar,
  });

  final String userName;
  final String userAvatar;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Hi, $userName👋",
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 20.sp,
              color: ColorStyle.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: ColorStyle.purple,
          ),
          onPressed: () {
            Get.find<GlobalController>().signOut();
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.shopping_cart,
            color: ColorStyle.purple,
          ),
          onPressed: () {
            var cartBox = Hive.box('cart');
            List<Book> cart =
                (cartBox.get('cart', defaultValue: <Book>[]) as List)
                    .cast<Book>();
            if (cart.isEmpty) {
              Get.snackbar('cart_empty'.tr, 'cart_empty_detail'.tr,
                  colorText: Colors.white, backgroundColor: Colors.red);
            } else {
              Get.toNamed(Routes.cartRoute);
            }
          },
        ),
        if (userAvatar.isNotEmpty)
          CircleAvatar(
            backgroundImage: NetworkImage(userAvatar),
          )
        else
          const CircleAvatar(
            child: Icon(Icons.person),
          ),
      ],
    );
  }
}
