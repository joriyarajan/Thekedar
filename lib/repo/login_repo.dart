import 'dart:convert';
import 'package:thekedar/models/login_model.dart';
import '../data/config.dart';
import '../services/api_service.dart';

class LoginRepo {
  static APIService sendRequest(String url) {
    return APIService(
        url: Config.gsApiUrl + url,
        parse: (response) {
          final parsed = json.decode(response.body);
          final dataJson = LoginModel.fromJson(parsed);
          return dataJson;
        });
  }
}