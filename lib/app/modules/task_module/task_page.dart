import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/modules/task_module/widgets/task_item_widget.dart';
import 'package:todo_app/app/themes/app_colors.dart';
import 'package:todo_app/app/themes/app_text_styles.dart';
import 'package:todo_app/app/translations/app_translations.dart';
import 'package:todo_app/app/utils/widgets/loading.dart';
import 'package:todo_app/app/utils/widgets/app_button/app_button.dart';
import 'package:todo_app/app/utils/widgets/no_data.dart';
import '../../../app/modules/task_module/task_controller.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TaskController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.title,
                          style: AppTextStyles.base.blackColor.s26.w600,
                        ),
                        const SizedBox(height: 4),
                        Obx(
                          () => Text(
                            AppTranslationKey.totaNumberTasks.replaceAll(
                              "%%number%%",
                              "${controller.listTask.length}",
                            ),
                            style: AppTextStyles
                                .base.blackColor.s14.kPrimaryColor.w400,
                          ),
                        ),
                      ],
                    ),
                    AppButton(
                      onPressed: controller.addTask,
                      color: AppColors.white,
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      prefixIcon: const Icon(
                        CupertinoIcons.add,
                        color: AppColors.kPrimaryColor,
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 8),
                          blurRadius: 12,
                          color: AppColors.black.withOpacity(0.1),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Obx(
                    () {
                      if (controller.listTask.isEmpty) {
                        return const NoDataView();
                      }
                      return ListView.separated(
                        padding: EdgeInsets.only(
                          bottom: Get.mediaQuery.padding.bottom + 88,
                        ),
                        itemBuilder: (ctx, index) => TaskItemWidget(
                          item: controller.listTask[index],
                        ),
                        separatorBuilder: (ctx, index) =>
                            const SizedBox(height: 16),
                        itemCount: controller.listTask.length,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Obx(
            () => controller.isLoading()
                ? const Loading(opacity: 0.5)
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
