import 'package:todo_app/app/data/api/api_connect.dart';
import 'package:todo_app/app/data/model/user.dart';
import 'package:todo_app/app/utils/constants.dart';

class TaskProvider {
  TaskProvider();

  // Get request
  Future<User> getUser() async {
    return User.fromJson(
      (await ApiConnect.instance.get(EndPoints.user)).getBody(),
    );
  }
}
