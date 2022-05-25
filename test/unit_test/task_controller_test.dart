import 'package:test/test.dart';
import 'package:todo_app/app/data/database/hive_adapter.dart';
import 'package:todo_app/app/data/model/response/task_item/task_item.dart';
import 'package:todo_app/app/modules/task_module/task_controller.dart';
import 'package:todo_app/app/utils/enum_task_status.dart';

void main() {
  group('Testing Task Controller', () {
    test('Add task item', () async {
      await HiveAdapter.init();
      var taskController = TaskController(status: TaskStatus.all)..onInit();
      var item = TaskItem(name: "test");
      await taskController.addTaskToDB(item);
      expect(taskController.listTask.contains(item), true);
    });
  });
}
