import 'package:bookly_app/core/error/failure.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import '../repos/home_repo.dart';

class FetchBookDetailsUseCase {
  final HomeRepo homeRepo;

  FetchBookDetailsUseCase(this.homeRepo);

  Future<Either<Failure, BookEntity>> call(String bookId) async {
    return await homeRepo.fetchBookDetails(bookId);
  }
}
