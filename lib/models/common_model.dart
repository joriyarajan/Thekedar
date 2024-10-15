class CommonModel {
  final String status, msg;

  CommonModel({
    required this.status,
    required this.msg,
  });

  factory CommonModel.fromJson(Map<String, dynamic> parsedJson) {
    var data;
    if (parsedJson['status'] == "success") {
      data = CommonModel(
        status: parsedJson['status'],
        msg: parsedJson['msg'],
      );
    } else {
      data = CommonModel(
        status: parsedJson['status'],
        msg: parsedJson['msg'],
      );
    }
    return data;
  }
}

