part of 'book_detail_cubit_dart_cubit.dart';

@immutable
sealed class BookDetailsState {}
final class BookDetailsInitial extends BookDetailsState {}
final class BookDetailsLoading extends BookDetailsState {}
final class BookDetailsSuccess extends BookDetailsState {
  final BookEntity book;
  BookDetailsSuccess(this.book);
}