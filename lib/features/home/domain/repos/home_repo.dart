import 'package:bookly_app/core/utils/error/failure.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBook();
  Future<Either<Failure, List<BookEntity>>> fetchNewestBook();
}
