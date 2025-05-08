import '../../domain/entity/category.dart';
import 'categories_result_model.dart';

class CategoryModel extends Categories {
  CategoryModel({
    required super.count,
    required super.next,
    required super.previous,
    required super.results,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    count: json["count"],
    next: json["next"] ?? "",
    previous: json["previous"] ?? "",
    results: List<CategoriesResultModel>.from(
      json["results"].map((x) => CategoriesResultModel.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(
      results.map((x) => (x as CategoryModel).toJson()),
    ),
  };
}
