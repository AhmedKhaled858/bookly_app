import 'package:bookly_app/features/home/presentation/manager/book_details_cubit.dart/cubit/book_detail_cubit_dart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/book_entity.dart';
import 'book_details_section.dart';
import 'custom_book_details_app_bar.dart';
import 'book_description_section.dart';

class BookDetailsViewBody extends StatefulWidget {
  final BookEntity book;

  const BookDetailsViewBody({super.key, required this.book});

  @override
  State<BookDetailsViewBody> createState() => _BookDetailsViewBodyState();
}

class _BookDetailsViewBodyState extends State<BookDetailsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<BookDetailsCubit>().fetchBookDetails(widget.book.bookId, widget.book);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDetailsCubit, BookDetailsState>(
      builder: (context, state) {
        if (state is BookDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BookDetailsSuccess) {
          final book = state.book;
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: CustomBookDetailsAppBar()),
              SliverToBoxAdapter(child: BookDetailsSection(book: book)),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(child: BookDescriptionSection(book: book)),
              const SliverToBoxAdapter(child: SizedBox(height: 15)),
            ],
          );
        } else {
          return const Center(child: Text("Something went wrong"));
        }
      },
    );
  }
}
