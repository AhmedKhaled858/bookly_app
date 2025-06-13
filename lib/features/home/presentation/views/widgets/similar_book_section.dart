import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_book_listview.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/book_entity.dart';

class SimilarBookSection extends StatelessWidget {
  final List<BookEntity> books;

  const SimilarBookSection({super.key, required this.books, });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You can also like ",
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 7),
        SimilarBookListView(books: books), // ✅ Pass the full list
      ],
    );
  }
}
