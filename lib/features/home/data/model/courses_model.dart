import 'package:osnv/features/home/domain/entity/courses.dart';

class CoursesModels extends Courses {
  CoursesModels({
    required super.count,
    required super.next,
    required super.previous,
    required super.results,
  });

  factory CoursesModels.fromJson(Map<String, dynamic> json) => CoursesModels(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<CoursesResultModel>.from(
      json["results"].map((x) => CoursesResultModel.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(
      results.map((x) => (x as CoursesResultModel).toJson()),
    ),
  };
}

class CoursesResultModel extends CoursesResult {
  CoursesResultModel({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.categoryName,
    required super.price,
    required super.image,
    required super.isPublished,
    required super.createdAt,
    required super.instructor,
    required super.sections,
    required super.isInWishlist,
  });

  factory CoursesResultModel.fromJson(Map<String, dynamic> json) =>
      CoursesResultModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        categoryName: json["category_name"],
        price: json["price"],
        image: json["image"],
        isPublished: json["is_published"],
        createdAt: DateTime.parse(json["created_at"]),
        instructor: json["instructor"],
        sections: List<SectionModels>.from(
          json["sections"].map((x) => SectionModels.fromJson(x)),
        ),
        isInWishlist: json["is_in_wishlist"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "category": category,
    "category_name": categoryName,
    "price": price,
    "image": image,
    "is_published": isPublished,
    "created_at": createdAt.toIso8601String(),
    "instructor": instructor,
    "sections": List<dynamic>.from(
      sections.map((x) => (x as SectionModels).toJson()),
    ),
    "is_in_wishlist": isInWishlist,
  };
}

class SectionModels extends Section {
  SectionModels({
    required super.id,
    required super.title,
    required super.order,
    required super.lessons,
  });

  factory SectionModels.fromJson(Map<String, dynamic> json) => SectionModels(
    id: json["id"],
    title: json["title"],
    order: json["order"],
    lessons: List<LessonModels>.from(
      json["lessons"].map((x) => LessonModels.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "order": order,
    "lessons": List<dynamic>.from(
      lessons.map((x) => (x as LessonModels).toJson()),
    ),
  };
}

class LessonModels extends Lesson {
  LessonModels({
    required super.id,
    required super.title,
    required super.videoUrl,
    required super.content,
    required super.order,
  });

  factory LessonModels.fromJson(Map<String, dynamic> json) => LessonModels(
    id: json["id"],
    title: json["title"],
    videoUrl: json["video_url"],
    content: json["content"],
    order: json["order"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "video_url": videoUrl,
    "content": content,
    "order": order,
  };
}
