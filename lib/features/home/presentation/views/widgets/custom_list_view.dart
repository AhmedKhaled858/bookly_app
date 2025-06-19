import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../domain/entities/book_entity.dart';
import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  final List<BookEntity> books;
  final ScrollController scrollController;

  const FeaturedBooksListView({
    super.key,
    required this.books,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    print('📚 Number of books displayed: ${books.length}');
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: ListView.builder(
        controller: scrollController,
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(
                  AppRouter.KBookDetailsView,
                  extra: books[index],
                );
              },
              child: CustomBookImage(imageUrl: books[index].image ?? ''),
            ),
          );
        },
      ),
    );
  }
}
