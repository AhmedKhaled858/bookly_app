import 'package:bookly_app/core/utils/widgets/custom_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bookly_app/core/utils/app_router.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).go(AppRouter.KHomeView);
              },
              icon: Icon(
                Icons.close,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            CustomCartIcon(),
          ],
        ),
      ),
    );
  }
}
