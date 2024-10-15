class LoginModel {
  final int userId;
  final msg, status;

  LoginModel({
        required this.status,
        required this.msg,
        required this.userId
      });

  factory LoginModel.fromJson(Map<String, dynamic> parsedJson) {
    var data;
    if (parsedJson['status'] == "success") {
      data = LoginModel(
        status: parsedJson['status'],
        msg: parsedJson['msg'] ?? "",
        userId: int.parse(parsedJson['userId']),
      );
    } else {
      data = LoginModel(
        status: parsedJson['status'],
        msg: parsedJson['msg'],
        userId: 0,
      );
    }
    return data;
  }
}
