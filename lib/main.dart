import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:osnv/features/authentication/presentation/BloC/auth/auth_bloc.dart';
import 'package:osnv/features/authentication/presentation/BloC/verify_code/verify_bloc.dart';
import 'package:osnv/features/home/presentation/Bloc/Mentors/mentors_bloc.dart';
import 'package:osnv/features/home/presentation/Bloc/categories/categories_bloc.dart';
import 'package:osnv/features/home/presentation/Bloc/couresesByDetails/courses_by_details_bloc.dart';
import 'package:osnv/features/home/presentation/Bloc/courses/courses_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'app.dart';
import 'core/di/service_locator.dart';
import 'features/home/presentation/Bloc/singleMentors/single_mentors_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocDir.path);
  await Hive.openBox('settings');
  await setup();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => sl<AuthBloc>()),
        BlocProvider<VerifyBloc>(create: (context) => sl<VerifyBloc>()),
        BlocProvider<MentorsBloc>(create: (context) => sl<MentorsBloc>()),
        BlocProvider<CategoriesBloc>(create: (context) => sl<CategoriesBloc>()),
        BlocProvider<SingleMentorsBloc>(create: (context) => sl<SingleMentorsBloc>()),
        BlocProvider<CoursesBloc>(create: (context) => sl<CoursesBloc>()),
        BlocProvider<CoursesByDetailsBloc>(create: (context)=> sl<CoursesByDetailsBloc>()),
      ],
      child: MyApp(),
    ),
  );
}
