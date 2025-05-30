import 'package:bookly_app/features/home/domain/entities/book_entity.dart';


//we return list of books in this local data source not futured list of books
//because we don't fetch data from internet we get it from cashed data

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBook();
  List<BookEntity> fetchNewestBook();
}
class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBook() {
    // TODO: implement fetchFeaturedBook
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBook() {
    // TODO: implement fetchNewestBook
    throw UnimplementedError();
  }
 
}