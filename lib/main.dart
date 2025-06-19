import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/theme/theme_data_enum.dart';
import 'package:bookly_app/core/theme/theme_state.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/simple_bloc_observer.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/usecase/fetch_featured_book_use_case.dart';
import 'package:bookly_app/features/home/domain/usecase/fetch_newest_book_use_case.dart';
import 'package:bookly_app/features/home/domain/usecase/toggle_theme_use_case.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_book_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/theme_cubit/theme_cubit_dart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'core/utils/functions/service_locator.dart';
import 'core/utils/widgets/background.dart';
import 'features/home/presentation/manager/cart_provider.dart';

void main() async {
  await Hive.initFlutter();
    setupServiceLocator();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  Bloc.observer = SimpleBlocObserver();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: BlocProvider(
        create: (_) => ThemeCubit(ToggleThemeUseCase()),
        child: const BooklyApp(),
      ),
    ),
  );
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBookUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            )..fetchFeaturedBooks();
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
              FetchNewestBookUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            )..fetchNewestBooks();
          },
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final isDark = state.mode == AppThemeMode.dark;

          return MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              scaffoldBackgroundColor: const Color.fromARGB(59, 255, 255, 255),
              textTheme: GoogleFonts.montserratTextTheme(
                ThemeData.light().textTheme.apply(
                      bodyColor: Colors.black87, // Light mode text color
                      displayColor: Colors.black87,
                    ),
              ),
            ),
            darkTheme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: const Color.fromARGB(0, 18, 18, 18),
              textTheme: GoogleFonts.montserratTextTheme(
                ThemeData.dark().textTheme.apply(
                      bodyColor: Color(0xFFEEEEEE), // Custom light grey text
                      displayColor: Color(0xFFEEEEEE),
                    ),
              ),
            ),
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            builder: (context, child) {
              return BackgroundContainer(
                isDark: isDark,
                child: child ?? const SizedBox(),
              );
            },
          );
        },
      ),
    );
  }
}
