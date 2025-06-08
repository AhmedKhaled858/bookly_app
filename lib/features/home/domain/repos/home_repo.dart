import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class HomeRepo{
  Future <Either< Failure,List<BookEntity>>>fetchFeaturedBook({int pageNumber =0});
  Future <Either<Failure,List<BookEntity>>>fetchNewestBook();
}