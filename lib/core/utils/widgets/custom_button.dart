import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textcolor,
    required this.borderRadius,
    required this.text,
    this.fontsized,
  });
  final Color backgroundColor;
  final Color textcolor;
  final BorderRadius borderRadius;
  final String text;
  final double? fontsized;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            color: textcolor,
            fontWeight: FontWeight.bold,
            fontSize: fontsized,
          ),
        ),
      ),
    );
  }
}
