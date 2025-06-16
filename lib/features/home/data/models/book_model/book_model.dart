import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

import 'access_info.dart';
import 'sale_info.dart';
import 'search_info.dart';
import 'volume_info.dart';
// any book model can say it is book entity
class BookModel extends BookEntity {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    required this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  }) : super(
          bookId: id ?? 'Unknown',
          image: volumeInfo.imageLinks?.smallThumbnail ?? '',
          title: volumeInfo.title ?? 'No Title',
          autherName: (volumeInfo.authors?.isNotEmpty ?? false)
              ? volumeInfo.authors!.first
              : 'Unknown',
          price: saleInfo?.listPrice?.amount ?? 0.0,
          rating: volumeInfo.averageRating ?? 0.0,
          description: volumeInfo.description ?? 'No Description',
        );

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        kind: json['kind'] as String?,
        id: json['id'] as String?,
        etag: json['etag'] as String?,
        selfLink: json['selfLink'] as String?,
        volumeInfo: VolumeInfo.fromJson(json['volumeInfo']),
        saleInfo: json['saleInfo'] != null
            ? SaleInfo.fromJson(json['saleInfo'])
            : null,
        accessInfo: json['accessInfo'] != null
            ? AccessInfo.fromJson(json['accessInfo'])
            : null,
        searchInfo: json['searchInfo'] != null
            ? SearchInfo.fromJson(json['searchInfo'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'id': id,
        'etag': etag,
        'selfLink': selfLink,
        'volumeInfo': volumeInfo.toJson(),
        'saleInfo': saleInfo?.toJson(),
        'accessInfo': accessInfo?.toJson(),
        'searchInfo': searchInfo?.toJson(),
      };
}

