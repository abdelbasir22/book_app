part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewsteBooksInitial extends NewestBooksState {}

final class NewsteBooksLoading extends NewestBooksState {}

final class NewsteBooksFailure extends NewestBooksState {
  final String errMessage;

  const NewsteBooksFailure(this.errMessage);
}

final class NewsteBooksSuccess extends NewestBooksState {
  final List<BookModel> books;

  const NewsteBooksSuccess(this.books);
}
