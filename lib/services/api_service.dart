import 'dart:io';

import 'package:dio/dio.dart';

import '../models/account.dart';

class ApiService {
  final String baseUrl = "https://interview-backend-3enbou53tq-uc.a.run.app";
  final Dio dio;

  ApiService(this.dio) {
    dio.options = BaseOptions(baseUrl: baseUrl);
  }

  Future<String> getHelloWorld() async {
    Response response = await dio.get('/');
    return response.data;
  }

  Future<String> postAccount(String encryptedValue) async {
    Response response =
        await dio.post('/account', data: {"encryptedRequest": encryptedValue});
    if (response.statusCode == 200) {
      String encryptedResponse = response.data['encryptedResponse'];
      return encryptedResponse;
    }
    throw HttpException(response.data);
  }

  Future<String> postEncrypt(Account account) async {
    Response response = await dio.post('/account', data: account.toJson());
    if (response.statusCode == 200) {}
    return response.data;
  }
}
