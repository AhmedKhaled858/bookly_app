// ignore_for_file: avoid_print
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/functions/save_books.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBook({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBook({int pageNumber = 0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBook({int pageNumber = 0}) async {
  try {
    var data = await apiService.get(endPoint: 'volumes?q=programming&startIndex=${pageNumber * 10}');
    if (data['items'] == null) {
      throw Exception('No items found in API response');
    }

    List<BookEntity> books = [];

    for (var item in data['items']) {
      try {
        books.add(BookModel.fromJson(item));
      } catch (e) {
        print('❌ Skipping invalid book: $e');
      }
    }

    print('✅ Total fetched books: ${data['items'].length}');
    print('✅ Total successfully parsed books: ${books.length}');

    saveBooksData(books, kFeaturedBox);
    return books;
  } catch (e) {
    print('fetchFeaturedBook error: $e');
    rethrow;
  }
}

  @override
  Future<List<BookEntity>> fetchNewestBook({int pageNumber = 0}) async {
    var data = await apiService.get(endPoint: 'volumes?q=programming&Sorting=newest&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBookList(data);
    saveBooksData(books, kNewestBox);
    return books;
   
  }  

  List<BookEntity> getBookList(Map<String, dynamic> data) {
  List<BookEntity> books = [];

  if (data['items'] == null) return books;

  for (var item in data['items']) {
    try {
      final book = BookModel.fromJson(item);
      books.add(book);
    } catch (e) {
      print('❌ Skipped invalid book item due to error: $e');
      print('🪵 Item data: $item');
    }
  }

  return books;
}


}