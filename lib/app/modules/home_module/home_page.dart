import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/modules/home_module/home_controller.dart';
import 'package:todo_app/app/modules/task_module/task_controller.dart';
import 'package:todo_app/app/modules/task_module/task_page.dart';
import 'package:todo_app/app/themes/app_colors.dart';
import 'package:todo_app/app/utils/enum_task_status.dart';
import 'package:todo_app/app/utils/widgets/app_button/base_button.dart';
import 'package:todo_app/app/utils/widgets/keep_alive_wrapper.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            children: [
              KeepAliveWrapper(
                child: GetBuilder<TaskController>(
                  init: TaskController(
                    status: TaskStatus.all,
                  ),
                  tag: TaskStatus.all.toString(),
                  builder: (controller) {
                    return TaskPage(
                      controller: controller,
                    );
                  },
                ),
              ),
              KeepAliveWrapper(
                child: GetBuilder<TaskController>(
                  init: TaskController(
                    status: TaskStatus.complete,
                  ),
                  tag: TaskStatus.complete.toString(),
                  builder: (controller) {
                    return TaskPage(
                      controller: controller,
                    );
                  },
                ),
              ),
              KeepAliveWrapper(
                child: GetBuilder<TaskController>(
                  init: TaskController(
                    status: TaskStatus.incomplete,
                  ),
                  tag: TaskStatus.incomplete.toString(),
                  builder: (controller) {
                    return TaskPage(
                      controller: controller,
                    );
                  },
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              maintainBottomViewPadding: false,
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 8),
                      blurRadius: 16,
                      color: AppColors.black.withOpacity(0.1),
                    )
                  ],
                ),
                height: 50,
                child: IntrinsicWidth(
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BottomNavItem(
                          currentIndex: controller.currentIndex(),
                          index: 0,
                          icon: Icons.all_inbox,
                          onPressed: controller.toPage,
                        ),
                        const SizedBox(width: 32),
                        BottomNavItem(
                          currentIndex: controller.currentIndex(),
                          index: 1,
                          icon: Icons.done_all_rounded,
                          onPressed: controller.toPage,
                        ),
                        const SizedBox(width: 32),
                        BottomNavItem(
                          currentIndex: controller.currentIndex(),
                          index: 2,
                          icon: Icons.pending_actions_rounded,
                          onPressed: controller.toPage,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "",
      //     ),
      //   ],
      //   enableFeedback: false,
      // ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.index,
    required this.currentIndex,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final int index;
  final int currentIndex;
  final IconData icon;
  final Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPressed: () {
        onPressed(index);
      },
      child: FittedBox(
        child: Icon(
          icon,
          color: currentIndex == index
              ? AppColors.kPrimaryColor
              : AppColors.deactiveColor,
        ),
      ),
    );
  }
}
