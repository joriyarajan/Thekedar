import 'package:get/get.dart';
import 'package:thekedar/repo/common_repo.dart';
import '../helpers/common_widget.dart';
import '../services/api_service.dart';
class RegisterController extends GetxController{
  late String username;
  late String new_password;
  late String confirm_password;
  late bool autoValidate;
  bool isLoading = false;

  @override
  onInit() {
    super.onInit();
    autoValidate = false;
    username = "";
    new_password = "";
    confirm_password = "";
  }
  userRegister() {
    isLoading = true;
    update();
    APIWeb().postData(
        CommonRepo.sendRequest("register.php"),
        '{"username": "' +
            Uri.encodeFull(username) +
            '", "password": "' +
            Uri.encodeFull(confirm_password) +
            '"}')
        .then(
          (data) {
        isLoading = false;
        update();
        if (data.status == "success") {
          Get.offAndToNamed('/');
        }
        showToastMessage(data.msg);
      },
    );
  }
}