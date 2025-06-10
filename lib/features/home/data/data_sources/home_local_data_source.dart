import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';


//we return list of books in this local data source not futured list of books
//because we don't fetch data from internet we get it from cashed data

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBook({int pageNumber = 0});
  List<BookEntity> fetchNewestBook({required int pageNumber});
}
class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBook({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = startIndex + 10;

    var box = Hive.box<BookEntity>(kFeaturedBox);
    int length =box.values.length;
    if(startIndex >=length|| endIndex >length) {
      return [];
    }
    return box.values.toList().sublist(startIndex,endIndex );
    
  }
  
  @override
  List<BookEntity> fetchNewestBook( {required int pageNumber}) {
    int startIndex = pageNumber * 10;
    int endIndex = startIndex + 10;
    var box = Hive.box<BookEntity>(kNewestBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList();
  }
 
}