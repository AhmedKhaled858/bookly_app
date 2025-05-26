import 'package:bookly_app/core/error/failure.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart' show HomeRepo;
import 'package:dartz/dartz.dart' show Either;
import '../../../../core/use_case/use_case.dart';

class FetchNewestBookUseCase extends UseCase<List <BookEntity>,NoParam>{
 final HomeRepo homeRepo;
 
  FetchNewestBookUseCase(this.homeRepo);
  
  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param])async {
  return await homeRepo.fetchNewestBook();
  }
}
