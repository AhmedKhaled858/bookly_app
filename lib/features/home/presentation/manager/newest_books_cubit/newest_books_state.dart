part of 'newest_books_cubit.dart';

@immutable
sealed class NewestBooksState {}

final class NewestBooksInitial extends NewestBooksState {}
final class NewestBooksLoading extends NewestBooksState {}
final class NewestBooksPaginationLoading extends NewestBooksState {}
final class NewestBooksPaginationFailure extends NewestBooksState {
  final String errorMessage;

  NewestBooksPaginationFailure(this.errorMessage);
}
final class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;

  NewestBooksSuccess(this.books);
}
final class NewestBooksFailure extends NewestBooksState {
  final String errorMessage;

  NewestBooksFailure(this.errorMessage);
}