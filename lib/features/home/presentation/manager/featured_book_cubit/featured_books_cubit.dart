import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/usecase/fetch_featured_book_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBookUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBookUseCase fetchFeaturedBookUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    emit(FeaturedBooksLoading());
    var result = await fetchFeaturedBookUseCase.call(pageNumber);
    result.fold(
      (failure) => emit(FeaturedBooksFailure(failure.message)),
      (books) => emit(FeaturedBooksSuccess(books)),
    );
  }
}
