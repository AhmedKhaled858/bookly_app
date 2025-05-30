
import 'package:hive/hive.dart';
part 'book_entity.g.dart';
// i want the command line to generate the book_entity.g.dart file
// run this command in the terminal: flutter packages pub run build_runner build --delete-conflicting-outputs
@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? autherName;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rating;
  BookEntity({
    required this.bookId,
    required this.image,
    required this.autherName,
    required this.price,
    required this.rating,
     required this.title,
     });
}
