class Courses {
  int count;
  dynamic next;
  dynamic previous;
  List<CoursesResult> results;

  Courses({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

}

class CoursesResult {
  int id;
  String title;
  String description;
  int category;
  String categoryName;
  String price;
  String image;
  bool isPublished;
  DateTime createdAt;
  String instructor;
  List<Section> sections;
  bool isInWishlist;

  CoursesResult({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.categoryName,
    required this.price,
    required this.image,
    required this.isPublished,
    required this.createdAt,
    required this.instructor,
    required this.sections,
    required this.isInWishlist,
  });

}

class Section {
  int id;
  String title;
  int order;
  List<Lesson> lessons;

  Section({
    required this.id,
    required this.title,
    required this.order,
    required this.lessons,
  });

}

class Lesson {
  int id;
  String title;
  String videoUrl;
  String content;
  int order;

  Lesson({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.content,
    required this.order,
  });

}
