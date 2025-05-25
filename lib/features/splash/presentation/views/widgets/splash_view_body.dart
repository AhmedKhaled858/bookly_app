import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _logoAnimation;
  late final Animation<Offset> _textAnimation;

  @override
  void initState() {
    super.initState();
    anitSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // Column still fills the screen, but both children animate into their
      // final spot at the center
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlideTransition(
          position: _logoAnimation,
          child: Image.asset(AssetsData.logo),
        ),
        const SizedBox(height: 16),
        SlideTransition(
          position: _textAnimation,
          child: const Text(
            'Read Free Books',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      // Get.off(() => HomeView(), transition: Transition.fade, duration: kTransitioDuration);
      GoRouter.of(context).push(AppRouter.KHomeView);
    });
  }

  void anitSlidingAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // slide the logo from ABOVE (y = -2) down into place (y = 0)
    _logoAnimation = Tween<Offset>(
      begin: const Offset(0, -3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // slide the text from BELOW (y = +2) up into place
    _textAnimation = Tween<Offset>(
      begin: const Offset(0, 3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }
}
