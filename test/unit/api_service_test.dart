import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_flow_bank/services/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  final Dio dio = Dio();
  final DioAdapter dioAdapter =
      DioAdapter(dio: dio, matcher: const UrlRequestMatcher());

  const String createAccountRequest =
      "2sIbYPYjqwqoqYdiT7tif2X2riuUZFM5HaYUHHQKJAYtO4EPN72ViIR+gFZv/urHexAJqk0k7/n7/sBELQ4zmWi9pcu/qW5eVH1Tuxps+C" +
          "xxlhrkaW4AI/yrxqOksI2wySwcNbuwNyvvV96lAJTTZUIyFQODALBMt9QBwZn3g+i2J/EJU9GRQ5SXXt448rX5b896w0nuGzNjQwTJiUB" +
          "SPbulzNMaYGuSf8gf1jm2R6xxAiVYosqrGC4eErgvDAlYkhA0/a2/QEtAieZfTyG9cHUjY59Rfd1ZNkvxZjlBDdTfzGvNFC4uriax4md2c1sS";
  const Map<String, dynamic> postAccountSuccessResponse = {
    "encryptedResponse": "vy+yX5sQ6c0XYI30E4n+gTAssc2omHYcuuWTkHLX3oQ="
  };

  const Map<String, dynamic> encryptValueRequest = {"hello": "World"};
  const Map<String, dynamic> encryptValueResponse = {
    "encryptedResponse": "KX5by8icYBVUsmpWTh78jQxKoQT678/02ez2VFEJ5Yw="
  };

  const Map<String, dynamic> decryptValueRequest = {
    "encryptedResponse": "KX5by8icYBVUsmpWTh78jQxKoQT678/02ez2VFEJ5Yw="
  };
  const Map<String, dynamic> decryptValueResponse = {"hello": "World"};

  dioAdapter.onGet(
    '/',
    (server) async => server.reply(
      200,
      "Hello, World!",
      delay: const Duration(seconds: 1),
    ),
  );

  dioAdapter.onPost(
    '/account',
    (server) async => server.reply(
      200,
      postAccountSuccessResponse,
      delay: const Duration(seconds: 1),
    ),
    data: createAccountRequest,
  );

  dioAdapter.onPost(
    '/encrypt',
    (server) async => server.reply(
      200,
      encryptValueResponse,
      delay: const Duration(seconds: 1),
    ),
    data: encryptValueRequest,
  );

  dioAdapter.onPost(
    '/decrypt',
    (server) async => server.reply(
      200,
      decryptValueResponse,
      delay: const Duration(seconds: 1),
    ),
    data: decryptValueRequest,
  );
  ApiService apiService = ApiService(dio);

  group('ApiServiceTest', () {
    test(
      'Test base route, should succeed and respond with hello world string',
      () async {
        String apiResponse = await apiService.getHelloWorld();
        expect(apiResponse, "Hello, World!");
      },
    );
    test(
      'Test post account route, should succeed and respond with encrypted response',
      () async {
        String apiResponse =
            await apiService.createAccount(createAccountRequest);
        expect(apiResponse, "vy+yX5sQ6c0XYI30E4n+gTAssc2omHYcuuWTkHLX3oQ=");
      },
    );
    test(
      'Test post encrypt route, should succeed and respond with an encrypted response',
      () async {
        String apiResponse = await apiService.encryptValue({"hello": "World"});
        expect(apiResponse, "KX5by8icYBVUsmpWTh78jQxKoQT678/02ez2VFEJ5Yw=");
      },
    );
    test(
      'Test post decrypt route, should succeed and respond with a decrypted response',
      () async {
        Map<String, dynamic> apiResponse = await apiService
            .decryptValue("KX5by8icYBVUsmpWTh78jQxKoQT678/02ez2VFEJ5Yw=");
        expect(apiResponse, {"hello": "World"});
      },
    );
  });
}
