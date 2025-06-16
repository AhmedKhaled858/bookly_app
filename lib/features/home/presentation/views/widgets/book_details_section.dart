import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/book_entity.dart';
import 'book_rating.dart';
import 'custom_book_item.dart';
class BookDetailsSection extends StatelessWidget {
  final BookEntity book;

  const BookDetailsSection({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final imageH = MediaQuery.of(context).size.height * 0.5.toDouble();
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: imageH * 0.6, child: CustomBookImage(imageUrl: book.image ?? '',)),
          const SizedBox(height: 15),
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            book.title,
            style: Styles.textStyle30,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Opacity(
            opacity: .8,
            child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              book.autherName ?? 'Unknown Author',
              style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          BookRating(mainAxisAlignment: MainAxisAlignment.center, rating: book.rating ?? 0.0,),
          const SizedBox(height: 15),
          BookAction(book: book,),
        ],
      ),
    );
  }
}

