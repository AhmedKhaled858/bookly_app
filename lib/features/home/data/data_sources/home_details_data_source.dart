import 'package:dio/dio.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import '../models/book_model/book_model.dart';

abstract class BookDetailsRemoteDataSource {
  Future<BookModel> fetchBookDetails(String bookId);
}

class BookDetailsRemoteDataSourceImpl implements BookDetailsRemoteDataSource {
  final ApiService apiService;

  BookDetailsRemoteDataSourceImpl(this.apiService);

  @override
  Future<BookModel> fetchBookDetails(String bookId) async {
    final data = await apiService.get(endPoint: 'volumes/$bookId');
    return BookModel.fromJson(data);
  }
}
