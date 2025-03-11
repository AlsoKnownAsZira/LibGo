import 'package:flutter/material.dart';
import 'package:venturo_core/shared/styles/color_style.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final double? height;
  final double? textSize;

  const MainButton({
    required this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.textSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorStyle.purple,
        ),
        child: Text(
          text,
          style:  TextStyle(color: ColorStyle.white,fontSize:textSize),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final double? height;
  final double? textSize;

  const SecondaryButton({
    required this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.textSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: ColorStyle.purple),
        ),
        child: Text(
          text,
          style:  TextStyle(color: ColorStyle.purple,fontSize:textSize),
        ),
      ),
    );
  }
}