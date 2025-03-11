import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:venturo_core/shared/styles/color_style.dart';

class TopClip extends StatelessWidget {
  const TopClip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        height: Get.height * 0.25,
        color: ColorStyle.purple,
      ),
    );
  }
}
