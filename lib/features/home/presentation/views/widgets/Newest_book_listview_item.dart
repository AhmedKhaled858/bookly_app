import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/colors/app_color.dart';

class NewestBookListViewItem extends StatelessWidget {
  final BookEntity book;

  const NewestBookListViewItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    // Determine theme colors dynamically
    final ThemeData theme = Theme.of(context);
    final Color textColor = theme.brightness == Brightness.dark 
        ? AppColors.darkTextColor 
        : AppColors.lightTextColor;

    return SizedBox(
      height: 125,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.7 / 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                book.image ?? '',
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Book Title
                  Text(
                    book.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20.copyWith(
                      fontFamily: kGTSectraFine,
                      color: textColor, // Apply dynamic text color
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600, // Increased weight for readability
                    ),
                  ),
                  // Author
                  Text(
                    book.autherName ?? '',
                    style: Styles.textStyle14.copyWith(
                      color: textColor.withOpacity(0.85), // Slight transparency for hierarchy
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Price + Rating Row
                  Row(
                    children: [
                      Text(
                        '${book.price ?? 0}€',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const Spacer(),
                      BookRating(
                        rating: book.rating ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
