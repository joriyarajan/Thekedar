import 'dart:typed_data';
import 'package:http/http.dart' as http;
import '../data/config.dart';
import 'dart:convert';
import 'dart:io';
import 'package:uuid/uuid.dart';
import '../helpers/common_widget.dart';
import 'data.dart';

class APIService {
  final String url;
  Function(http.Response response) parse;
  APIService({required this.url, required this.parse});
}

class APIWeb {
  Future getData(APIService resource) async {
    final response = await http.get(Uri.parse(resource.url));
    printDebug("STATUS: " + response.statusCode.toString());
    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future postData(APIService resource, String body) async {
    final username = Config.gsApiKey;
    final password = Config.gsApiPassword;
    final credentials = '$username:$password';
    final stringToBase64 = utf8.fuse(base64);
    final encodedCredentials = stringToBase64.encode(credentials);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
    };
    printDebug(resource.url);
    printDebug(body);
    final response =
        await http.post(Uri.parse(resource.url), headers: headers, body: body);
    printDebug("BODY: " + response.body);

    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      printDebug(response.body);
      throw Exception('Failed to load data!');
    }
  }

  Future<http.StreamedResponse> postDataMultipartBytes(
      String url, List<Uint8List> files, List<DataParams> params) async {
    final username = Config.gsApiKey;
    final password = Config.gsApiPassword;
    final credentials = '$username:$password';
    final stringToBase64 = utf8.fuse(base64);
    final encodedCredentials = stringToBase64.encode(credentials);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
    };
    printDebug(Uri.parse(Config.gsApiUrl + url).toString());
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(Config.gsApiUrl + url));
    request.headers.addAll(headers);
    files.forEach((file) {
      request.files.add(http.MultipartFile.fromBytes('sign_image', file,
          filename: const Uuid().v1() + '.png'));
    });

    params.forEach((param) {
      request.fields[param.label] = param.value;
    });

    printDebug(request.fields.toString());

    printDebug(request.files.toString());

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return response;
    } else {
      printDebug(response.statusCode.toString());
      printDebug(response.reasonPhrase.toString());
      throw Exception('Failed to load data!');
    }
    return response;
  }

  Future<http.StreamedResponse> postDataMultipart(
      String url, List<FileParams> files, List<DataParams> params) async {
    final username = Config.gsApiKey;
    final password = Config.gsApiPassword;
    final credentials = '$username:$password';
    final stringToBase64 = utf8.fuse(base64);
    final encodedCredentials = stringToBase64.encode(credentials);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
    };
    printDebug(Uri.parse(Config.gsApiUrl + url).toString());
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(Config.gsApiUrl + url));
    request.headers.addAll(headers);
    files.forEach((file) {
      printDebug(
          file.fileName + "  " + file.file.readAsBytes().asStream().toString());
      request.files.add(http.MultipartFile(file.fileName,
          file.file.readAsBytes().asStream(), file.file.lengthSync(),
          filename: file.file.path.split("/").last));
    });

    params.forEach((param) {
      request.fields[param.label] = param.value;
    });

    printDebug(request.fields.toString());

    http.StreamedResponse response = await request.send();


    if (response.statusCode == 200) {
      return response;
    } else {
      printDebug(response.statusCode.toString());
      printDebug(response.reasonPhrase.toString());
      throw Exception('Failed to load data!');
    }
    return response;
  }
}
