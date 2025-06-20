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

    if (!_isFetching && currentScroll >= maxScroll * 0.7) {
      _isFetching = true;
      BlocProvider.of<NewestBooksCubit>(context)
          .fetchNewestBooks(pageNumber: nextPage++);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          setState(() {
            books.addAll(state.books);
            _isFetching = false;
          });
        } else if (state is NewestBooksPaginationFailure) {
          _isFetching = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(buildErrorSnackBar(state.errorMessage));
        }
      },
      builder: (context, state) {
        if (state is NewestBooksLoading && books.isEmpty) {
          return const Center(child: NewestBookListViewLoadingIndicator());
        } else if (state is NewestBooksFailure && books.isEmpty) {
          return Center(child: Text(state.errorMessage));
        } else {
          return NewestBookListView(
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
