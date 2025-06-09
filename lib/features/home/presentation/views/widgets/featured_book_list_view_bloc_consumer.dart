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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        } else if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context)
          .showSnackBar(buildErrorSnackBar(state.errorMessage));
        }
      },
      builder: (context, state) {
         if (state is FeaturedBooksLoading && books.isEmpty) {
          return const Center(child: FeaturedBookListViewLoadingIndicator());
        } else if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          // Always return the list with current books
          return FeaturedBooksListView(books: books);
        } else if (state is FeaturedBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: FeaturedBookListViewLoadingIndicator());
        }
      },
    );
  }
}
