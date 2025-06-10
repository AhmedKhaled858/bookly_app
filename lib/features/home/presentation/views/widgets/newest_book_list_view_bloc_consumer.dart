import 'package:bookly_app/features/home/presentation/views/widgets/newest_book_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/widgets/build_error_show_snack_bar.dart';
import '../../../domain/entities/book_entity.dart';
import '../../manager/newest_books_cubit/newest_books_cubit.dart';
import 'newest_book_list_view_loading_indicator.dart';

class NewestBookListViewBlocConsumer extends StatefulWidget {
  const NewestBookListViewBlocConsumer({super.key});

  @override
  State<NewestBookListViewBlocConsumer> createState() =>
      _NewestBookListViewBlocConsumerState();
}

class _NewestBookListViewBlocConsumerState extends State<NewestBookListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        } else if (state is NewestBooksPaginationFailure) {
          ScaffoldMessenger.of(context)
          .showSnackBar(buildErrorSnackBar(state.errorMessage));
        }
      },
     builder: (context, state) {
         if (state is NewestBooksLoading && books.isEmpty) {
          return const Center(child: NewestBookListViewLoadingIndicator());
        } else if (state is NewestBooksSuccess ||
            state is NewestBooksPaginationLoading ||
            state is NewestBooksPaginationFailure) {
          // Always return the list with current books
          return NewestBookListView(books: books);
        } else if (state is NewestBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: NewestBookListViewLoadingIndicator());
        }
      },
    );
  }
}
