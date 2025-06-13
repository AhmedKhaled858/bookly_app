import 'package:bookly_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_book_section.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/book_entity.dart';
class BookDetailsViewBody extends StatelessWidget {
  final List<BookEntity> book;

  const BookDetailsViewBody({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: CustomBookDetailsAppBar(),
        ),
        SliverToBoxAdapter(
          child: BookDetailsSection(book: book[0]),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        SliverToBoxAdapter(
          child: SimilarBookSection(books: book), // ✅ Pass book list here
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 15),
        ),
      ],
    );
  }
}


