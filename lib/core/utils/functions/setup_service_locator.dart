import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart' show GetIt;
import '../../../features/home/data/data_sources/home_local_data_source.dart';
import '../../../features/home/data/data_sources/home_remote_data_source.dart';
import '../../../features/home/data/repos/home_repo_impl.dart' show HomeRepoImpl;
import '../api_service.dart';
final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton(ApiService(Dio(),),);
  getIt.registerSingleton<HomeRepoImpl>( 
            HomeRepoImpl(
                homeRemoteDataSource: HomeRemoteDataSourceImpl(
                 getIt.get<ApiService>(),
                  ),
                homeLocalDataSource: HomeLocalDataSourceImpl(),
              ),);
}