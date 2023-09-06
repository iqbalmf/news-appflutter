import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/config/app_config.dart';
import 'package:news_app/data/remote/news_remote_datasource.dart';
import 'package:news_app/data/repositories/news_repositoryimpl.dart';
import 'package:news_app/domain/repository/repository.dart';
import 'package:news_app/domain/usecase/source_usecase.dart';
import 'package:news_app/framework/api_helper.dart';
import 'package:news_app/presentation/source/bloc/source_bloc.dart';

final locator = GetIt.instance;

void init() {
  /*
  * Api Service, Rest
  * */
  locator.registerLazySingleton(
      () => ApiHelper(Dio(BaseOptions(baseUrl: 'https://newsapi.org/v2/'))));


  /*
  * Repository
  * */
  locator.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(locator()));


  /*
  * Data Source Remote
  * */
  locator.registerLazySingleton<NewsRemoteDataSource>(() => NewsRemoteDataSourceImpl(locator()));


  /*
  * Usecase
  * */
  locator.registerLazySingleton(() => SourceUsecase(locator()));

  /*
  * Cubit
  * */
  locator.registerFactory(() => SourceCubit(locator()));
}