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
    this.title,
    this.purpose,
    this.date,
    this.startTime,
    this.endTime,
    this.repeat,
    this.description,
    this.reminder,
    this.isCompleted,
});
}

