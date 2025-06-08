import 'package:bookly_app/features/home/presentation/manager/featured_book_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';

class FeaturedBookListViewBlocBuilder extends StatefulWidget {
  const FeaturedBookListViewBlocBuilder({super.key});

  @override
  State<FeaturedBookListViewBlocBuilder> createState() => _FeaturedBookListViewBlocBuilderState();
}

class _FeaturedBookListViewBlocBuilderState extends State<FeaturedBookListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FeaturedBooksSuccess || state is FeaturedBooksPaginationLoading) {
          return FeaturedBooksListView(books: books);

        } else if (state is FeaturedBooksFailure) {
          print('Error: ${state.errorMessage}');
          print(state.toString());
          print('Stack Trace: ${StackTrace.current}');
          return Center(child: Text(state.errorMessage ?? 'Unknown error occurred.'));
        } else {
          return const Center(child: Text('Unexpected state'));
        }
      },
    );
  }
}
