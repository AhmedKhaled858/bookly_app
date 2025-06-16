import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/usecase/fetch_book_details_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../features/home/data/data_sources/home_details_data_source.dart';
import '../../../core/utils/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Core
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  // Data sources
  getIt.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(getIt<ApiService>()));
  getIt.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl()); // if applicable
  getIt.registerLazySingleton<BookDetailsRemoteDataSource>(
      () => BookDetailsRemoteDataSourceImpl(getIt<ApiService>()));

  // Repo
  getIt.registerLazySingleton<HomeRepoImpl>(() => HomeRepoImpl(
        homeLocalDataSource: getIt<HomeLocalDataSource>(),
        homeRemoteDataSource: getIt<HomeRemoteDataSource>(),
        bookDetailsRemoteDataSource: getIt<BookDetailsRemoteDataSource>(),
      ));

  // Use Cases
  getIt.registerLazySingleton<FetchBookDetailsUseCase>(
      () => FetchBookDetailsUseCase(getIt<HomeRepoImpl>()));
}
