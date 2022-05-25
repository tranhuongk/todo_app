import 'package:test/test.dart';
import 'package:todo_app/app/data/model/response/task_item/task_item.dart';
import 'package:todo_app/app/modules/task_module/widgets/task_item_widget.dart';
import 'package:todo_app/app/utils/enum_task_status.dart';

void main() {
  group('Testing Task Item Widget', () {
    var taskItem = TaskItemWidget(item: TaskItem(name: "name"));
    test('Testing Change Status Of Task Item Widget', () {
      var status = TaskStatus.complete;
      taskItem.setStatus(status);
      expect(taskItem.item.status, status.string);
    });
  });
}
