import 'package:get/get.dart';
import '../data/session.dart';
import '../helpers/common_widget.dart';
import '../repo/login_repo.dart';
import '../services/api_service.dart';
class LoginController extends GetxController{
  late String username;
  late String password;
  late bool autoValidate;
  bool isLoading = false;
  Session session = Session();

  @override
  onInit() {
    super.onInit();
    autoValidate = false;
    username = "";
    password = "";
  }
  saveUserDataLocally() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }
  userLogin() {
    isLoading = true;
    update();
    APIWeb().postData(
        LoginRepo.sendRequest("login.php"),
        '{"username": "' +
            Uri.encodeFull(username) +
            '", "password": "' +
            Uri.encodeFull(password) +
            '"}')
        .then(
          (data) {
        isLoading = false;
        update();
        if (data.status == "success") {
          session.setUserId(data.userId);
          session.setUsername(username);
          Get.offAndToNamed('/dashboard');
        }
        showToastMessage(data.msg);
      },
    );
  }
}