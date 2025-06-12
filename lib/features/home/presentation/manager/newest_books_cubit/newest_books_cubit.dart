import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/usecase/fetch_newest_book_use_case.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';
class NewestBooksCubit extends Cubit<NewestBooksState> {
  final FetchNewestBookUseCase fetchNewestBookUseCase;

  NewestBooksCubit(this.fetchNewestBookUseCase) : super(NewestBooksInitial());

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
      emit(NewestBooksLoading());
    }

    final result = await fetchNewestBookUseCase.call(pageNumber);

    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(NewestBooksFailure(failure.message));
        } else {
          emit(NewestBooksPaginationFailure(failure.message));
        }
      },
      (books) {
        emit(NewestBooksSuccess(books));
      },
    );
  }
}
