import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similer_books_state.dart';

class SimilerBooksCubit extends Cubit<SimilerBooksState> {
  SimilerBooksCubit(this.homeRepo) : super(SimilerBooksInitial());

  final HomeRepo homeRepo;

  Future<void> featchSimilerBooks({required String category}) async {
    emit(SimilerBooksLoading());
    var resalt = await homeRepo.fetchSimilerBooks(category: category);
    resalt.fold((failure) {
      emit(SimilerBooksFailure(failure.errMessage));
    }, (books) {
      emit(SimilerBooksSuccess(books));
    });
  }
}
