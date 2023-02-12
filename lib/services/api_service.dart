import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../models/bank_account.dart';

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
      Map<String, dynamic> decodedResponse = jsonDecode(response.data);
      String encryptedResponse = decodedResponse['encryptedResponse'];
      return encryptedResponse;
    }
    throw HttpException(response.data['error']);
  }

  Future<String> encryptValue(Map<String, dynamic> plainValue) async {
    Response response =
        await dio.post('/echo/encrypt', data: jsonEncode(plainValue));
    Map<String, dynamic> decodedEncryptedData = jsonDecode(response.data);
    if (response.statusCode == 200) {
      return decodedEncryptedData['encryptedResponse'];
    }
    throw HttpException(response.data['error']);
  }

  Future<BankAccount> decryptValue(String encryptedValue) async {
    String encodedRequestData = jsonEncode({"encryptedString": encryptedValue});
    Response response =
        await dio.post('/echo/decrypt', data: encodedRequestData);
    if (response.statusCode == 200) {
      return BankAccount.fromJson(jsonDecode(response.data));
    }
    throw HttpException(response.data['error']);
  }
}
