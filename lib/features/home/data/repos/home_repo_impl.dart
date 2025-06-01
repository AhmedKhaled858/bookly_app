import 'package:bookly_app/core/error/failure.dart';
import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

// this class is responsible for implementing the HomeRepo interface
class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBook() async {
    List<BookEntity> booksList;
    try{
       booksList = homeLocalDataSource.fetchFeaturedBook();
      if(booksList.isNotEmpty){
       // return Future.value(right(booksList));
       return right(booksList);
      }
       booksList = await homeRemoteDataSource.fetchFeaturedBook();
    //  return Future.value(right(books));
        return right(booksList);
    
    }catch(e){
      //return Future.value(left(Failure()));
      return left(ServerFailure());
    }
  }
  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBook()async {
    List<BookEntity> newestBooksList;
   try{
       newestBooksList = homeLocalDataSource.fetchNewestBook();
      if(newestBooksList.isNotEmpty){
       // return Future.value(right(booksList));
       return right(newestBooksList);
      }
       newestBooksList = await homeRemoteDataSource.fetchNewestBook();
    //  return Future.value(right(books));
        return right(newestBooksList);

    }catch(e){
      //return Future.value(left(Failure()));
      return left(Failure());
    }
  }
  }
