import 'package:dio/dio.dart';
import 'package:osnv/features/home/data/model/category_model.dart';
import 'package:osnv/features/home/data/model/courses_model.dart';
import 'package:osnv/features/home/data/model/mentors_model.dart';
import 'package:osnv/features/home/data/model/single_mentors_model.dart';

abstract class MentorsDatasource {
  Future<MentorsResponceModel> mentors();

  Future<SingleMentorModel> singleMentors({required int id});

  Future<CategoryModel> category();

  Future<CoursesModels> courses();

  Future<CoursesResultModel> courseByDetails({required int id});

  Future<MentorsResponceModel> searchMentor();

  Future<CoursesModels> searchCourses();
}

class MentorsDatasourceImpl implements MentorsDatasource {
  final Dio dio;

  MentorsDatasourceImpl({required this.dio});

  @override
  Future<MentorsResponceModel> mentors() async {
    final response = await dio.get(
      "https://manuchehra.pythonanywhere.com/api/mentors/top/",
      options: Options(headers: {"accept": "application/json"}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return MentorsResponceModel.fromJson(response.data);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<SingleMentorModel> singleMentors({required int id}) async {
    final response = await dio.get(
      "https://manuchehra.pythonanywhere.com/api/mentors/$id/",
      options: Options(headers: {"accept": "application/json"}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return SingleMentorModel.fromJson(response.data);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<CategoryModel> category() async {
    final response = await dio.get(
      "https://manuchehra.pythonanywhere.com/api/categories/",
      options: Options(headers: {"accept": "application/json"}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return CategoryModel.fromJson(response.data);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<CoursesModels> courses() async {
    final response = await dio.get(
      "https://manuchehra.pythonanywhere.com/api/courses/",
      options: Options(headers: {"accept": "application/json"}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return CoursesModels.fromJson(response.data);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<CoursesResultModel> courseByDetails({required int id}) async {
    final response = await dio.get(
      "https://manuchehra.pythonanywhere.com/api/courses/$id/",
      options: Options(headers: {"accept": "application/json"}),
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      return CoursesResultModel.fromJson(response.data);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<CoursesModels> searchCourses() {
    // TODO: implement searchCourses
    throw UnimplementedError();
  }

  @override
  Future<MentorsResponceModel> searchMentor() {
    // TODO: implement searchMentor
    throw UnimplementedError();
  }
}
