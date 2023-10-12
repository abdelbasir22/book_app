import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_reop_impl.dart';
import 'package:bookly_app/features/home/presentaion/manger/simlier_books_cubit/similer_books_cubit.dart';
import 'package:bookly_app/features/home/presentaion/views/book_details.dart';
import 'package:bookly_app/features/home/presentaion/views/home_view.dart';
import 'package:bookly_app/features/search/presentaion/views/search_view.dart';
import 'package:bookly_app/features/splash/presentaion/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearckView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplaslView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
            create: (context) => SimilerBooksCubit(getit.get<HomeRepoImpl>()),
            child: BookDetailsView(
              bookModel: state.extra as BookModel,
            )),
      ),
      GoRoute(
        path: kSearckView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
