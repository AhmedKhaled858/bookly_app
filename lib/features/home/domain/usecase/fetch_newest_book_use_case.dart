import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart' show HomeRepo;
import 'package:dartz/dartz.dart' show Either;
import '../../../../core/error/failure.dart';
import '../../../../core/use_case/use_case.dart';

class FetchNewestBookUseCase extends UseCase<List <BookEntity>, NoParam> {
  // This class is responsible for fetching the newest books from the repository.
  // It extends UseCase to define a contract for the use case.
 final HomeRepo homeRepo;
 
  FetchNewestBookUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    return await homeRepo.fetchNewestBook();
  }
}
