import 'package:bookly_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/book_entity.dart';

class BookDetailsView extends StatelessWidget {
  final List <BookEntity> book;

  const BookDetailsView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BookDetailsViewBody(book: book),
    );
  }
}
