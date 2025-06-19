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
          child: isDark
              ? Image.asset(
                  AssetsData.backGround1,
                  fit: BoxFit.cover,
                )
              : Opacity(
                  opacity: 0.8,
                  child: Image.asset(
                    AssetsData.backGroundLight,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        if (isDark)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        child,
      ],
    );
  }
}
