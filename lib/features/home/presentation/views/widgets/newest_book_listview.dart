import 'dart:async';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_book_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NewestBookListView extends StatefulWidget {
  final List<BookEntity> books;

  const NewestBookListView({super.key, required this.books});

  @override
  State<NewestBookListView> createState() => _NewestBookListViewState();
}

class _NewestBookListViewState extends State<NewestBookListView> {
  final ScrollController _scrollController = ScrollController();
  bool _hasTriggered = false;
  int nextPage = 1;
  late final StreamSubscription _cubitSubscription;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    _cubitSubscription = BlocProvider.of<NewestBooksCubit>(context).stream.listen((state) {
      if (state is NewestBooksSuccess || state is NewestBooksFailure) {
        if (mounted) {
          setState(() {
            _hasTriggered = false;
          });
        }
      }
    });
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (!_hasTriggered && currentScroll >= maxScroll * 0.7) {
      _hasTriggered = true;
      BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(pageNumber: nextPage++);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _cubitSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.zero,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.KBookDetailsView, extra: widget.books[index]);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: NewestBookListViewItem(book: widget.books[index]),
            ),
          );
        },
      ),
    );
  }
}
