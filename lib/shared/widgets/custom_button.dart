import 'package:flutter/material.dart';
import 'package:venturo_core/shared/styles/color_style.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const MainButton({required this.onPressed, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor:
              ColorStyle.purple // Change this to your secondary button color
          ),
      child: Text(
        text,
        style: const TextStyle(color: ColorStyle.white),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const SecondaryButton({required this.onPressed, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(color: ColorStyle.purple), 
      ),
      child: Text(
        text,
        style: const TextStyle(color: ColorStyle.purple),
      ),
    );
  }
}
