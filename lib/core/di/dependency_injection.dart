
import 'package:dio/dio.dart';
import 'package:flutteradvnced/core/networking/api_constants.dart';
import 'package:flutteradvnced/core/networking/api_service.dart';
import 'package:flutteradvnced/core/networking/dio_factory.dart';
import 'package:flutteradvnced/features/login/data/repos/login_repo.dart';
import 'package:flutteradvnced/features/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt= GetIt.instance;


Future<void> setupGetIt()async{
// Dio & Api Service

Dio dio = DioFactory.getDio();
getIt.registerLazySingleton<ApiService>(() => ApiService(dio, baseUrl: ApiConstants.apiBaseUrl));


// login 

getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));




}