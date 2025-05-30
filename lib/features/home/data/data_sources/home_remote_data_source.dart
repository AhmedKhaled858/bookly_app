import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBook();
  Future<List<BookEntity>> fetchNewestBook();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBook()async {
   var data= await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming');
    List<BookEntity> books = getBookList(data);
    return books;
  }


  @override
  Future<List<BookEntity>> fetchNewestBook()async {
     var data= await apiService.get(endPoint: 'volumes?filtering=free-ebooks&q=programming&Sorting=newest');
    List<BookEntity> books = getBookList(data);
    return books;
   
  }

  
  List<BookEntity> getBookList(Map<String, dynamic> data) {
     List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}