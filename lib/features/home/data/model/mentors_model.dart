import 'package:osnv/features/home/data/model/single_mentors_model.dart';
import 'package:osnv/features/home/domain/entity/mentors_entity.dart';


class MentorsResponceModel extends MentorsResponce {
  MentorsResponceModel({
    required super.count,
    required super.next,
    required super.previous,
    required super.results,
  });

  factory MentorsResponceModel.fromJson(Map<String, dynamic> json) =>
      MentorsResponceModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List.from(
          json["results"].map((x) => SingleMentorModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => (x as SingleMentorModel).toJson())),
  };
}
