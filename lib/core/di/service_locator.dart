import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:osnv/features/authentication/data/datasource/remote/auth_remote_datasourse.dart';
import 'package:osnv/features/authentication/data/repo/repo.dart';
import 'package:osnv/features/authentication/domain/usecase/auth_email_with_password_usecase.dart';
import 'package:osnv/features/authentication/presentation/BloC/auth/auth_bloc.dart';
import 'package:osnv/features/authentication/presentation/BloC/verify_code/verify_bloc.dart';
import 'package:osnv/features/home/data/datasourse/mentors_datasource_remote.dart';
import 'package:osnv/features/home/data/repository/mentors_repository_impl.dart';
import 'package:osnv/features/home/domain/repsitory/home_repository.dart';
import 'package:osnv/features/home/domain/usecase/categories_usecase.dart';
import 'package:osnv/features/home/domain/usecase/courses_by_details_usecase.dart';
import 'package:osnv/features/home/domain/usecase/courses_usecase.dart';
import 'package:osnv/features/home/domain/usecase/mentors_usecase.dart';
import 'package:osnv/features/home/domain/usecase/single_mentor_usecase.dart';
import 'package:osnv/features/home/presentation/Bloc/Mentors/mentors_bloc.dart';
import 'package:osnv/features/home/presentation/Bloc/categories/categories_bloc.dart';
import 'package:osnv/features/home/presentation/Bloc/courses/courses_bloc.dart';
import 'package:osnv/features/home/presentation/Bloc/singleMentors/single_mentors_bloc.dart';

import '../../features/authentication/domain/repo/repo.dart';
import '../../features/authentication/domain/usecase/verify_code_usecase.dart';
import '../../features/home/presentation/Bloc/couresesByDetails/courses_by_details_bloc.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton(()=> Dio());

  sl.registerLazySingleton<AuthRemoteDatasourse>(()=> AuthRemoteDatasourseImpl(dio: sl()));
  sl.registerLazySingleton<AuthRepository>(()=> AuthRepositoryImpl(sl()));

  sl.registerLazySingleton<MentorsDatasource>(()=> MentorsDatasourceImpl(dio: sl()));
  sl.registerLazySingleton<HomeRepository>(()=> MentorsRepositoryImpl(sl()));

  // repositories
  sl
    ..registerLazySingleton(()=> AuthRegisterWithEmailUsecase(repository: sl()))
    ..registerLazySingleton(()=> VerifyCodeUsecase(repository: sl()))
    ..registerLazySingleton(()=> MentorsUsecase(sl()))
    ..registerLazySingleton(()=> SingleMentorUsecase(sl()))
    ..registerLazySingleton(()=> CategoriesUsecase(sl()))
    ..registerLazySingleton(()=> CoursesUsecase(homeRepository: sl()))
    ..registerLazySingleton(()=> CoursesByDetailsUsecase(homeRepository: sl()));

  // Bloc
  sl
    ..registerLazySingleton(()=> AuthBloc(sl()))
    ..registerLazySingleton(()=> VerifyBloc(sl()))
    ..registerLazySingleton(()=> MentorsBloc(sl()))
    ..registerLazySingleton(()=> SingleMentorsBloc(sl()))
    ..registerLazySingleton(()=> CategoriesBloc(sl()))
    ..registerLazySingleton(()=> CoursesBloc(sl()))
    ..registerLazySingleton(()=> CoursesByDetailsBloc(sl()));


}