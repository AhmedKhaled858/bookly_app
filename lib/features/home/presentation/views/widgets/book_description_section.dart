// ignore_for_file: deprecated_member_use

import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/book_entity.dart';

class BookDescriptionSection extends StatelessWidget {
  final BookEntity book;

  const BookDescriptionSection({super.key, required this.book});

  String cleanDescription(String? description) {
    if (description == null) return "No description available.";
    return description.replaceAll(RegExp(r'<[^>]*>'), '').trim();
  }

  @override
  Widget build(BuildContext context) {
    final cleanedText = cleanDescription(book.description);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Color(0xFF1A1A1A),
                ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.white.withOpacity(0.01)
                  : Colors.black.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              
              cleanedText,
              style: Styles.textStyle16.copyWith(
                color: isDark ? Colors.white : Color(0xFF1A1A1A),
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
