import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

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

  Future<String> createAccount(String encryptedValue) async {
    Response response =
        await dio.post('/account', data: {"encryptedRequest": encryptedValue});
    if (response.statusCode == 200) {
      String encryptedResponse = response.data['encryptedResponse'];
      return encryptedResponse;
    }
    throw HttpException(response.data);
  }

  Future<String> encryptValue(Map<String, dynamic> plainValue) async {
    Response response =
        await dio.post('/encrypt', data: jsonEncode(plainValue));
    Map<String, dynamic> decodedEncryptedData = response.data;
    return decodedEncryptedData['encryptedResponse'];
  }

  Future<Map<String, dynamic>> decryptValue(String encryptedValue) async {
    String encodedRequestData = jsonEncode(
        {"encryptedString": "KX5by8icYBVUsmpWTh78jQxKoQT678/02ez2VFEJ5Yw="});
    Response response = await dio.post('/decrypt', data: encodedRequestData);
    return response.data;
  }
}
