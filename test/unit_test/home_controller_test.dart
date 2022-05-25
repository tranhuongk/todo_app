import 'package:test/test.dart';
import 'package:todo_app/app/modules/home_module/home_controller.dart';

void main() {
  group('Testing Home Controller', () {
    test('Current index will be set if index >= 0 && index <=2', () {
      var homeController = HomeController()..onInit();
      var index = 1;
      homeController.toPage(index);
      expect(homeController.currentIndex(), 1);
    });
  });
}
