// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/model/response/task_item/task_item.dart';
import 'package:todo_app/app/themes/app_colors.dart';
import 'package:todo_app/app/themes/app_text_styles.dart';
import 'package:todo_app/app/translations/app_translations.dart';
import 'package:todo_app/app/utils/enum_task_status.dart';
import 'package:todo_app/app/utils/widgets/app_button/base_button.dart';
import 'package:todo_app/app/utils/widgets/app_text_field/app_text_field.dart';

class TaskItemWidget extends StatelessWidget {
  TaskItemWidget({
    Key? key,
    required this.item,
    this.isEdit = false,
    this.errorText,
  }) : super(key: key);
  TaskItem item;
  final bool isEdit;
  final String? errorText;

  Rx<TaskStatus> get _status => item.status.toTaskStatus.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 8),
              blurRadius: 16,
              color: AppColors.black.withOpacity(0.05),
            ),
          ],
          border: Border.all(
            color: _status().color,
            width: 0.5,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isEdit)
              Text(
                item.name,
                style: AppTextStyles.base.w600.blackColor,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            else
              AppTextField(
                hintText: AppTranslationKey.enterText,
                margin: EdgeInsets.zero,
                backgroundColor: AppColors.background,
                onChanged: (text) {
                  item.name = text;
                },
                errorText: errorText,
              ),
            const SizedBox(height: 12),
            Text(
              AppTranslationKey.statusNowQs,
              style: AppTextStyles.base.lightGrayColor.s10.italic.w400,
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: Obx(() => TaskStatusWidget(
                        onPressed: setStatus,
                        status: TaskStatus.inprocess,
                        isActive: _status() == TaskStatus.inprocess,
                      )),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Obx(() => TaskStatusWidget(
                        onPressed: setStatus,
                        status: TaskStatus.complete,
                        isActive: _status() == TaskStatus.complete,
                      )),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Obx(() => TaskStatusWidget(
                        onPressed: setStatus,
                        status: TaskStatus.incomplete,
                        isActive: _status() == TaskStatus.incomplete,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void setStatus(TaskStatus stt) {
    item.status = stt.key;
    if (item.isInBox) {
      item.save();
    }
    _status(stt);
  }
}

class TaskStatusWidget extends StatelessWidget {
  const TaskStatusWidget({
    Key? key,
    this.status = TaskStatus.inprocess,
    this.isActive = false,
    required this.onPressed,
  }) : super(key: key);

  final TaskStatus status;
  final bool isActive;
  final Function(TaskStatus) onPressed;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPressed: () {
        onPressed(status);
      },
      borderRadius: BorderRadius.circular(40),
      child: Container(
        decoration: BoxDecoration(
          color: isActive
              ? status.color.withOpacity(0.12)
              : status.color.withOpacity(0.05),
          border: isActive
              ? Border.all(
                  color: status.color,
                )
              : null,
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.all(4),
        child: Center(
          child: SizedBox(
            height: 14,
            child: FittedBox(
              child: Text(status.string),
            ),
          ),
        ),
      ),
    );
  }
}
