// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/app/translations/app_translations.dart';

part 'task_item.g.dart';

@HiveType(typeId: 1)
class TaskItem extends HiveObject with EquatableMixin {
  @HiveField(0)
  String name;
  @HiveField(1)
  String status;
  @HiveField(2)
  DateTime? lastUpdate;

  TaskItem({
    required this.name,
    this.status = AppTranslationKey.inprocess,
  });

  @override
  Future<void> save() {
    lastUpdate = DateTime.now();
    return super.save();
  }

  // factory TaskItem.fromJson(Map<String, dynamic> json) => TaskItem(
  // 			name: json['name'] as String?,
  // 			status: json['status'] as String?,
  // 			lastUpdate: json['last_update'] as String?,
  // 		);

  // Map<String, dynamic> toJson() => {
  // 			'name': name,
  // 			'status': status,
  // 			'last_update': lastUpdate,
  // 		};

  @override
  List<Object?> get props => [name, status, lastUpdate];
}
