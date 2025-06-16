import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/usecase/fetch_book_details_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/book_entity.dart';

part 'book_detail_cubit_dart_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit(this.fetchBookDetailsUseCase) : super(BookDetailsInitial());
  final FetchBookDetailsUseCase fetchBookDetailsUseCase;
  Future<void> fetchBookDetails(String bookId, BookEntity fallback) async {
    try {
      emit(BookDetailsLoading());
      final result = await fetchBookDetailsUseCase.call(bookId);
      result.fold(
        (failure) => emit(BookDetailsSuccess(fallback)),
        (book) => emit(BookDetailsSuccess(book)),
      );
    } catch (e) {
      emit(BookDetailsSuccess(fallback));
    }
  }
}
