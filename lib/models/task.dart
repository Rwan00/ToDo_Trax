import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject{
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  int? purpose;
  @HiveField(3)
  String? date;
  @HiveField(4)
  String? startTime;
  @HiveField(5)
  String? endTime;
  @HiveField(6)
  int? repeat;
  @HiveField(7)
  String? description;
  @HiveField(8)
  int? reminder;
  @HiveField(9)
  int? isCompleted;

  Task({
     this.id,
    required this.title,
    required this.purpose,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.repeat,
    required this.description,
    required this.reminder,
    required this.isCompleted,
});
}

