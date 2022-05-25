import 'package:get/state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/app/data/model/response/task_item/task_item.dart';
import 'package:todo_app/app/utils/enum_task_status.dart';

class HiveAdapter {
  static late final Box _box;
  static const String _boxKey = "TodoBox";
  static final RxList<TaskItem> _listTask = <TaskItem>[].obs;
  static List<TaskItem> get listAllTask => _listTask;
  static List<TaskItem> get listCompleteTask =>
      _listTask.where((e) => e.status == TaskStatus.complete.key).toList();
  static List<TaskItem> get listIncompleteTask =>
      _listTask.where((e) => e.status == TaskStatus.incomplete.key).toList();

  static Future init([String? key]) async {
    // initial hive
    await Hive.initFlutter();

    // register adapter
    Hive.registerAdapter(TaskItemAdapter());
    _box = await Hive.openBox<TaskItem>(key ?? _boxKey);

    _listTask.assignAll(getAllTask());

    _box.listenable().addListener(() {
      _listTask.assignAll(getAllTask());
    });
  }

  static List<TaskItem> getAllTask() {
    return (_box.values.toList() as List<TaskItem>)
      ..sort((a, b) => b.key.compareTo(a.key));
  }

  static Future add(TaskItem item) async {
    item.lastUpdate = DateTime.now();
    await _box.add(item);
  }
}
