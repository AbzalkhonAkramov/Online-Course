import 'package:osnv/features/home/domain/entity/single_mentor_entiry.dart';

class MentorsResponce {
  int count;
  dynamic next;
  dynamic previous;
  List <SingleMentorEntity> results;

  MentorsResponce({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

}

