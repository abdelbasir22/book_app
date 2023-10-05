import 'package:bookly_app/features/home/presentaion/views/book_details.dart';
import 'package:bookly_app/features/home/presentaion/views/home_view.dart';
import 'package:bookly_app/features/search/presentaion/views/search_view.dart';
import 'package:bookly_app/features/splash/presentaion/views/splash_view.dart';
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
        builder: (context, state) => const BookDetailsView(),
      ),
      GoRoute(
        path: kSearckView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
