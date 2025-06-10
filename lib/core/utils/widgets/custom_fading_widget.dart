import 'package:flutter/material.dart';

class CustomFadingWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const CustomFadingWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  _CustomFadingWidgetState createState() => _CustomFadingWidgetState();
}

class _CustomFadingWidgetState extends State<CustomFadingWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.stop();     // optional: stops repeating animation
    _controller.dispose();  // ✅ required to avoid the ticker error
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacityAnimation.value,
      duration: widget.duration,
      child: widget.child,
    );
  }
}
