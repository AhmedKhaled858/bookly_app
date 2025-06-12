import 'package:flutter/material.dart';
import 'package:bookly_app/core/utils/assets.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  final bool isDark;

  const BackgroundContainer({
    super.key,
    required this.child,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
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
