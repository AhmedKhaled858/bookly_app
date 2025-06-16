  import 'package:bookly_app/core/utils/api_service.dart';
import '../../domain/entities/book_entity.dart';
import '../models/book_model/book_model.dart';

abstract class BookDetailsRemoteDataSource {
  Future<List<BookEntity>> fetchBookDetails(String bookId);
}
class BookDetailsRemoteDataSourceImpl implements BookDetailsRemoteDataSource {
  final ApiService apiService;

  BookDetailsRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchBookDetails(String bookId) async {
    try {
      final data = await apiService.get(endPoint: 'volumes/$bookId');
      // The API returns a single book, not a list
      final book = BookModel.fromJson(data);
      return [book];
    } catch (e) {
      print('fetchBookDetails error: $e');
      rethrow;
    }
  }
}
