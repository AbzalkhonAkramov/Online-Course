import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:osnv/features/authentication/data/datasource/auth_remote_datasourse.dart';
import 'package:osnv/features/authentication/data/repo/repo.dart';
import 'package:osnv/features/authentication/domain/usecase/usecase.dart';
import 'package:osnv/features/authentication/presentation/BloC/auth/auth_bloc.dart';

import '../../features/authentication/domain/repo/repo.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton(()=> Dio());

  sl.registerLazySingleton<AuthRemoteDatasourse>(()=> AuthRemoteDatasourseImpl(dio: sl()));
  sl.registerLazySingleton<AuthRepository>(()=> AuthRepositoryImpl(sl()));
  sl.registerLazySingleton(()=> RegisterWithEmail(repository: sl()));

  sl.registerLazySingleton(()=> AuthBloc(sl()));
}