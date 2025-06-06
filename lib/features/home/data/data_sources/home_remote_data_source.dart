import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/functions/save_books.dart';
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
Future<List<BookEntity>> fetchFeaturedBook() async {
  try {
    print('➡️ Starting fetchFeaturedBook');
    var data = await apiService.get(endPoint:'volumes?q=programming&fillter=free_ebooks');
    print('✅ API response received: $data');

    if (data['items'] == null) {
      throw Exception('❌ No "items" key found in API response');
    }

    List<BookEntity> books = getBookList(data);
    print('✅ Parsed ${books.length} books');
    saveBooksData(books, kFeaturedBox);
    return books;
  } catch (e, stackTrace) {
    print('❌ fetchFeaturedBook error: $e');
    print('🪵 StackTrace: $stackTrace');
    rethrow; // Let the repository catch and wrap this error
  }
}


  @override
  Future<List<BookEntity>> fetchNewestBook()async {
     var data= await apiService.get(endPoint: 'volumes?q=programming&Sorting=newest');
    List<BookEntity> books = getBookList(data);
    saveBooksData(books, kNewestBox);
    return books;
   
  }  

  List<BookEntity> getBookList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  if (data['items'] == null) {
    print('⚠️ No items to parse in getBookList');
    return books;
  }

  for (var item in data['items']) {
    try {
      books.add(BookModel.fromJson(item));
    } catch (e) {
      print('❌ Error parsing item: $e');
    }
  }

  return books;
}



}