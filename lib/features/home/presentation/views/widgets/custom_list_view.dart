import 'dart:async';

import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import '../../manager/featured_book_cubit/featured_books_cubit.dart';

class FeaturedBooksListView extends StatefulWidget {
  final List<BookEntity> books;

  const FeaturedBooksListView({super.key, required this.books});

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  final ScrollController _scrollController = ScrollController();
  bool _hasTriggered = false;
  int nextPage = 1;
  late final StreamSubscription _cubitSubscription;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    // Listen for Cubit state to reset scroll trigger
    _cubitSubscription = BlocProvider.of<FeaturedBooksCubit>(context).stream.listen((state) {
      if (state is FeaturedBooksSuccess || state is FeaturedBooksFailure) {
        if (mounted) {
          setState(() {
            _hasTriggered = false;
          });
        }
      }
    });
  }

  void _onScroll() {
    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (!_hasTriggered && currentScroll >= maxScrollExtent * 0.7) {
      _hasTriggered = true;
      BlocProvider.of<FeaturedBooksCubit>(context)
          .fetchFeaturedBooks(pageNumber: nextPage++);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _cubitSubscription.cancel(); // Cancel stream subscription to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('📚 Number of books displayed: ${widget.books.length}');

    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
            child: CustomBookImage(imageUrl: widget.books[index].image ?? ''),
          );
        },
      ),
    );
  }
}
