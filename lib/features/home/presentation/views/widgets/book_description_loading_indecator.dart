import 'package:flutter/material.dart';

class BookDescriptionLoadingIndicator extends StatelessWidget {
  const BookDescriptionLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDark ? Colors.grey[800] : Colors.grey[300];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 20,
            decoration: BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}
