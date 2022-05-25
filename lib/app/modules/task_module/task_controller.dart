import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/database/hive_adapter.dart';
import 'package:todo_app/app/data/model/response/task_item/task_item.dart';
import 'package:todo_app/app/modules/task_module/widgets/task_item_widget.dart';
import 'package:todo_app/app/translations/app_translations.dart';
import 'package:todo_app/app/utils/enum_task_status.dart';
import 'package:todo_app/app/utils/widgets/app_button/app_button.dart';
import '../../../app/data/provider/task_provider.dart';

class TaskController extends GetxController {
  final TaskProvider? provider;
  final TaskStatus status;
  TaskController({
    this.provider,
    required this.status,
  });

  String title = "";
  List<TaskItem> get listTask => status == TaskStatus.all
      ? HiveAdapter.listAllTask
      : status == TaskStatus.complete
          ? HiveAdapter.listCompleteTask
          : HiveAdapter.listIncompleteTask;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    title = status.string;
  }

  void addTask() {
    TaskItem item = TaskItem(
      name: "",
      status: status != TaskStatus.all ? status.key : TaskStatus.inprocess.key,
    );
    final RxString _errorText = "".obs;
    Get.dialog(
      AlertDialog(
        content: Obx(
          () => TaskItemWidget(
            isEdit: true,
            item: item,
            errorText: _errorText(),
          ),
        ),
        insetPadding: const EdgeInsets.all(12),
        titlePadding: EdgeInsets.zero,
        contentPadding: const EdgeInsets.all(16),
        buttonPadding: EdgeInsets.zero,
        actionsPadding: const EdgeInsets.all(12),
        actions: [
          AppButton(
            onPressed: () async {
              if (item.name.isEmpty) {
                _errorText(AppTranslationKey.noEmpty);
                return;
              }
              Get.back();
              await addTaskToDB(item);
            },
            text: AppTranslationKey.save,
          )
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }

  Future addTaskToDB(TaskItem item) async {
    isLoading(true);
    await HiveAdapter.add(item);
    isLoading(false);
  }
}
