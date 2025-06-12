import 'package:flutter/material.dart';
import 'package:bookly_app/core/utils/assets.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;

  const BackgroundWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            isDark ? AssetsData.backGround1 : AssetsData.backGroundLight,
            fit: BoxFit.cover,
          ),
        ),
        if (isDark)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
        child,
      ],
    );
  }
}
