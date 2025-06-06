import 'package:bookly_app/features/home/presentation/manager/featured_book_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookListViewBlocBuilder extends StatelessWidget {
  const FeaturedBookListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FeaturedBooksSuccess) {
          if (state.books.isEmpty) {
            return const Center(child: Text('No featured books available.'));
          }
          return FeaturedBooksListView(books: state.books);
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
