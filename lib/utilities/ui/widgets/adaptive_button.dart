import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AdaptiveButton extends StatelessWidget {
  const AdaptiveButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final Color background = const Color(0xff4BCD3E);
  final double width = double.infinity;
  final double height = 50;
  final bool isUpperCase = true;
  final double radius = 50.0;
  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    if (GetPlatform.isIOS) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: background,
          ),
          width: width,
          height: height,
          child: MaterialButton(
            onPressed: onPressed,
            child: Text(
              isUpperCase ? text.toUpperCase() : text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: background,
        ),
        width: width,
        height: height,
        child: CupertinoButton.filled(
          onPressed: onPressed,
          child: Text(
            isUpperCase ? text.toUpperCase() : 'ios $text',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
