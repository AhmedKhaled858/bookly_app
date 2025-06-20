import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' show DioException;
import '../../../../core/error/failure.dart';
import '../data_sources/home_details_data_source.dart';

// this class is responsible for implementing the HomeRepo interface
class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;
  final BookDetailsRemoteDataSource bookDetailsRemoteDataSource;

  HomeRepoImpl({required this.homeLocalDataSource, required this.homeRemoteDataSource, required this.bookDetailsRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBook({int pageNumber = 0}) async {
    List<BookEntity> booksList;
    try{
       booksList = homeLocalDataSource.fetchFeaturedBook(
        pageNumber: pageNumber,
       );
      if(booksList.isNotEmpty){
       // return Future.value(right(booksList));
       return right(booksList);
      }
       booksList = await homeRemoteDataSource.fetchFeaturedBook(pageNumber: pageNumber);
    //  return Future.value(right(books));
        return right(booksList);
    
    }catch(e){
      //return Future.value(left(Failure()));
      if(e is DioException){
        return left(ServerFailure.fromDiorError(e));
      }
      else{
        return left(ServerFailure(e.toString()));
      }
    }
  }
  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBook({int pageNumber = 0}) async {
    List<BookEntity> newestBooksList;
   try{
       newestBooksList = homeLocalDataSource.fetchNewestBook(pageNumber:  pageNumber);
      if(newestBooksList.isNotEmpty){
       // return Future.value(right(booksList));
       return right(newestBooksList);
      }
       newestBooksList = await homeRemoteDataSource.fetchNewestBook(pageNumber: pageNumber);
    //  return Future.value(right(books));
        return right(newestBooksList);

    }catch(e){
      //return Future.value(left(Failure()));
      if(e is DioException){
        return left(ServerFailure.fromDiorError(e));
      }
      else{
        return left(ServerFailure(e.toString()));
      }
    }
  }
  
@override
Future<Either<Failure, BookEntity>> fetchBookDetails(String bookId) async {
  try {
    final books = await bookDetailsRemoteDataSource.fetchBookDetails(bookId);
    if (books.isNotEmpty) {
      print('Book details fetched successfully: ${books.first.title}');
      return right(books.first);
    } else {
      return left(ServerFailure('No book found for the given ID'));
    }
  } 
    catch (e) {
    //return Future.value(left(Failure()));
    if(e is DioException){
      return left(ServerFailure.fromDiorError(e));
    }
    else{
      return left(ServerFailure(e.toString()));
    }
  }
}

  }
