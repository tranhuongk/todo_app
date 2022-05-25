import 'package:test/test.dart';
import 'package:todo_app/app/data/database/hive_adapter.dart';
import 'package:todo_app/app/data/model/response/task_item/task_item.dart';

void main() {
  group('Testing Hive Database', () {
    test('Test get all task', () async {
      await HiveAdapter.init();
      expect(HiveAdapter.listAllTask, HiveAdapter.getAllTask());
    });

    test('Test add task item', () async {
      var item = TaskItem(name: "test");
      await HiveAdapter.add(item);
      expect(HiveAdapter.listAllTask.contains(item), true);
    });
  });
}
