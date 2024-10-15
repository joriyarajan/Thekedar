import 'dart:convert';
import '../services/api_service.dart';
import '../models/common_model.dart';
import '../data/config.dart';

class CommonRepo {
  static APIService sendRequest(String url) {
    return APIService(
        url: Config.gsApiUrl + url,
        parse: (response) {
          final parsed = json.decode(response.body);
          final dataJson = CommonModel.fromJson(parsed);
          return dataJson;
        });
  }
}
