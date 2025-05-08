import 'package:osnv/features/home/domain/entity/categories_result.dart';

class CategoriesResultModel extends CategoriesResult {

  CategoriesResultModel(
      {required super.id, required super.name, required super.slug});

  factory CategoriesResultModel.fromJson(Map<String, dynamic> json) =>
      CategoriesResultModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "slug": slug,
      };
  }