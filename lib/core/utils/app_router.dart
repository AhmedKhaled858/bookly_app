// ignore_for_file: constant_identifier_names

import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/cart_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/domain/entities/book_entity.dart';

abstract class AppRouter {
  static const KSplashView = '/';
  static const KHomeView = '/homeView';
  static const KBookDetailsView = '/bookDetailsView';
  static const KSearchView = '/SearchView';
  static const kCartView = '/cartView';

  static final router = GoRouter(
  initialLocation: KSplashView, // 👈 Force app to start at SplashView
  routes: [
    GoRoute(
      path: KSplashView,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kCartView,
      builder: (context, state) => const CartView(),
    ),
    GoRoute(
      path: KHomeView,
      builder: (context, state) => const HomeView(),
    ),
  GoRoute(
    path: KBookDetailsView,
    builder: (context, state) {
      final book = state.extra as BookEntity;
      return BookDetailsView(book: [book]); // Wrap in a lists
    },
  ),
    GoRoute(
      path: KSearchView,
      builder: (context, state) => const SearchView(),
    ),
  ],
);

}
