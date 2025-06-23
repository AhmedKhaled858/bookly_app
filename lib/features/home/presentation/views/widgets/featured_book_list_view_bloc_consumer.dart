import 'package:bookly_app/features/home/presentation/manager/featured_book_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_book_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/widgets/build_error_show_snack_bar.dart';
import '../../../domain/entities/book_entity.dart';
class FeaturedBookListViewBlocConsumer extends StatefulWidget {
  const FeaturedBookListViewBlocConsumer({super.key});

  @override
  State<FeaturedBookListViewBlocConsumer> createState() =>
      _FeaturedBookListViewBlocConsumerState();
}

class _FeaturedBookListViewBlocConsumerState extends State<FeaturedBookListViewBlocConsumer> {
  List<BookEntity> books = [];
  final ScrollController _scrollController = ScrollController();
  int nextPage = 1;
  bool _isFetching = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    // to start fetching more books when the user scrolls to 70% of the list
    if (!_isFetching && currentScroll >= maxScroll * 0.7) {
      _isFetching = true;
      BlocProvider.of<FeaturedBooksCubit>(context)
      .fetchFeaturedBooks(pageNumber: nextPage++);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
          _isFetching = false;
        } else if (state is FeaturedBooksPaginationFailure) {
          _isFetching = false;
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorSnackBar(state.errorMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksLoading && books.isEmpty) {
          return const Center(child: FeaturedBookListViewLoadingIndicator());
        } else if (state is FeaturedBooksFailure && books.isEmpty) {
          return Center(child: Text(state.errorMessage));
        } else {
          return FeaturedBooksListView(
            books: books,
            scrollController: _scrollController,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
