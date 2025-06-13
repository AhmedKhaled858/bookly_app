import 'package:flutter/material.dart';
import '../../../domain/entities/book_entity.dart';
import 'custom_book_item.dart';

class SimilarBookListView extends StatelessWidget {
  final List<BookEntity> books;

  const SimilarBookListView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final book = books[index];
          return CustomBookImage(imageUrl: book.image ?? '');

        },
      ),
    );
  }
}
