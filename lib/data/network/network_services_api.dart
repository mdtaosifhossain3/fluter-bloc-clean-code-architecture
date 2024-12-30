import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc_clean_code_architecture/data/exceptions/app_exceptions.dart';
import 'package:bloc_clean_code_architecture/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkServicesApi implements BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    try {
      final res = await http.get(Uri.parse(url)).timeout(Duration(seconds: 50));
      jsonResponse = returnResponse(res);
    } on SocketException {
      throw InternetException('');
    } on TimeoutException {
      throw RequestTimeOut("");
    } catch (e) {
      throw ServerException("");
    }

    return jsonResponse;
  }

  @override
  Future postApi(String url, data) async {
    dynamic jsonResponse;

    try {
      final res = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 50));
      print(res.statusCode);
      jsonResponse = returnResponse(res);
    } on SocketException {
      throw InternetException('');
    } on TimeoutException {
      throw RequestTimeOut("");
    } catch (e) {
      throw ServerException("");
    }
    print("The Response: $jsonResponse");
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 401:
        throw UnauthorizedException("");
      case 500:
        throw FetchDataException("");
      default:
        throw UnauthorizedException("");
    }
  }
}
