// ignore_for_file: deprecated_member_use

import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import '../../../../../core/theme/colors/app_color.dart';
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
 final ThemeData theme = Theme.of(context);
    final Color textColor = theme.brightness == Brightness.dark 
        ? AppColors.darkTextColor 
        : AppColors.lightTextColor;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1300),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Description",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: textColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  
                  cleanedText,
                  style: Styles.textStyle16.copyWith(
                    color: textColor,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
