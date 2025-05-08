import 'package:osnv/features/home/domain/entity/categories_result.dart';

class Categories {
  int count;
  dynamic next;
  dynamic previous;
  List<CategoriesResult> results;

  Categories({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

}
