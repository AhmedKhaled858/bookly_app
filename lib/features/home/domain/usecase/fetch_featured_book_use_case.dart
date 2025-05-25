import 'package:bookly_app/core/utils/error/failure.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart'
    show HomeRepo;
import 'package:dartz/dartz.dart' show Either;

//descripe why use usecase in code (and this step inside Domain layer )to decide what should we do ?
//!we use usecase to make check permssion
//?if this user can make fetch for books or no!?
// and we make this step to make the code better but we don't need it in this project
// and we use this step to make the permssion check to can fetch data or navigate him to another page
//! we make handling for my code

class FetchFeaturedBookUseCase {
  final HomeRepo homeRepo;

  FetchFeaturedBookUseCase(this.homeRepo);

  Future<Either<Failure, List<BookEntity>>> call() {
    return homeRepo.fetchFeaturedBook();
  }
}
