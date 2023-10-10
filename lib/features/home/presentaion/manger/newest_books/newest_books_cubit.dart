import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewsteBooksInitial());

  final HomeRepo homeRepo;

  Future<void> featchNewestBooks() async {
    emit(NewsteBooksLoading());
    var result = await homeRepo.fetchNewstBooks();
    result.fold((failure) {
      emit(NewsteBooksFailure(failure.errMessage));
    }, (books) {
      emit(NewsteBooksSuccess(books));
    });
  }
}
