import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_book_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewestBookListView extends StatelessWidget {
  final List<BookEntity> books;
  final ScrollController scrollController;

  const NewestBookListView({
    super.key,
    required this.books,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .8,
      child: ListView.builder(
        controller: scrollController,
        padding: EdgeInsets.zero,
        itemCount: books.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.KBookDetailsView,
                extra: books[index],
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: NewestBookListViewItem(book: books[index]),
            ),
          );
        },
      ),
    );
  }
}
