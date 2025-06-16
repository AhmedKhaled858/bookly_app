import 'package:flutter/material.dart';

class BookDetailsSectionLoadingIndicator extends StatelessWidget {
  const BookDetailsSectionLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final baseColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey[800]
        : Colors.grey[300];

    Widget shimmerBox({double height = 20, double width = double.infinity}) {
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(12),
        ),
      );
    }

    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.3,
            child: shimmerBox(height: screenHeight * 0.3, width: 200),
          ),
          const SizedBox(height: 15),
          shimmerBox(height: 25, width: 220), // Title
          const SizedBox(height: 10),
          shimmerBox(height: 18, width: 160), // Author
          const SizedBox(height: 10),
          shimmerBox(height: 20, width: 120), // Rating
          const SizedBox(height: 20),
          shimmerBox(height: 40, width: 200), // Action Button
        ],
      ),
    );
  }
}
