import 'package:flutter/material.dart';
import 'package:bookly_app/core/utils/assets.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  final bool isDark;

  const BackgroundContainer({
    Key? key,
    required this.child,
    required this.isDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            AssetsData.backGround1,
            fit: BoxFit.cover,
          ),
        ),
        if (isDark)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        child,
      ],
    );
  }
}
