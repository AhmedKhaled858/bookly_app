import 'package:bookly_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/book_entity.dart';
import '../../domain/usecase/fetch_book_details_use_case.dart';
import '../manager/book_details_cubit.dart/cubit/book_detail_cubit_dart_cubit.dart';
import '../../../../core/utils/functions/service_locator.dart';

class BookDetailsView extends StatelessWidget {
  final List<BookEntity> book;

  const BookDetailsView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookDetailsCubit(getIt.get<FetchBookDetailsUseCase>()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BookDetailsViewBody(
          book: book[0], // Assuming you're always showing the first book
        ),
      ),
    );
  }
}
