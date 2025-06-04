import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';


//we return list of books in this local data source not futured list of books
//because we don't fetch data from internet we get it from cashed data

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBook();
  List<BookEntity> fetchNewestBook();
}
class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBook() {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
    
  }

  @override
  List<BookEntity> fetchNewestBook() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
 
}