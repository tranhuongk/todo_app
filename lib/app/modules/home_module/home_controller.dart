import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/provider/home_provider.dart';

class HomeController extends GetxController {
  HomeController({this.provider});
  final HomeProvider? provider;

  final RxInt currentIndex = 0.obs;

  PageController? pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(
      initialPage: currentIndex(),
    );
  }

  @override
  void onClose() {
    pageController?.dispose();
    super.onClose();
  }

  void toPage(int index) {
    if (index > 2 || index < 0) {
      return;
    }
    currentIndex(index);
    if (pageController != null && pageController!.hasClients) {
      pageController!.animateToPage(
        index,
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    }
  }
}
