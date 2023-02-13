import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_flow_bank/models/user_account.dart';
import 'package:flutter_flow_bank/models/address.dart';
import 'package:flutter_flow_bank/models/bank_account.dart';
import 'package:flutter_flow_bank/models/dependent.dart';
import 'package:flutter_flow_bank/services/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  final Dio dio = Dio();
  final DioAdapter dioAdapter =
      DioAdapter(dio: dio, matcher: const UrlRequestMatcher());

  Dependent dependent = Dependent('Junior');
  Address address = Address("12 Middleway", "Area B", "Main City", "Mainland",
      "General Country", "ML1 2HJ");
  UserAccount userAccount = UserAccount('John', 'Kevin', 'Doe',
      DateTime(1990, 10, 10), "male", [dependent], address, '');

  UserAccount emptyUserAccount =
      UserAccount("", "", "", DateTime(1800, 01, 01), "male", [], address, '');

  UserAccount invalidUserAccount = UserAccount(
      "___", "___", "____", DateTime(1800, 01, 01), "___", [], address, '');

  const Map<String, dynamic> encryptedUserAccountResponse = {
    "encryptedResponse":
        "miH8RJ/zHT0w0yABHEXrZ19XMoB5H7t/HZ29jFKW3lFiVAeLXluLeQpgBOiLFrYU2ddILUDunE5ScrqG98okfCMQiG16QlfQs0NAF+hezx7zQji/" +
            "XV0aq2w9vPi5OEEgtLdKDVen17EMoCMKjEeM/UsgKRkWLL7hlmhJysVMew61A1KXx0W3Zg80W3xtoqC" +
            "GXc5VR1T2F+Y909fFl2ERoVI7I+BfmwYcjYJ7cjYWR7EfwbWFe66ccPGGgLbtkt+cVe0hxnefe8ZYS8/kVsqeVopUrTxDdqsCDLZYWAIW0mOuSwYXF8EEt2qmbhoqWIN1a7Ln3JWe9PWWKj8zmWdbGZqMo9v" +
            "nnKkZrJ6tDRYJMKaIbs8TgT26y8/FSWD0neOkzUuA6yHM1/eOVa96YOhU1cXh28tjcfWDDVFxa4jpKDP2zverLrqfOFUCPV9jwIPNlc3gWFbL2L1U/PUHMbLwHbppethKvmcOG1+V6WiJtPUE6MQk82dugaKQ07/HnPLD5tugQC8SjBcQxr6USHmYb" +
            "wWvKNX1UN3EdL+n7RnNdgAcwNztOElmlMZkXVanJfLAqbH2FOMREuBmRFEZWB4pSdNlSQQ24abKY9p4Be2y64Q="
  };

  const Map<String, dynamic> encryptedBankAccountResponse = {
    "encryptedResponse": "vy+yX5sQ6c0XYI30E4n+gTAssc2omHYcuuWTkHLX3oQ="
  };

  const Map<String, dynamic> decryptedBankAccountResponse = {
    "accountNumber": "5339460"
  };

  BankAccount bankAccount = BankAccount("5339460");

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
      jsonEncode(encryptedBankAccountResponse),
      delay: const Duration(seconds: 1),
    ),
    data: encryptedUserAccountResponse,
  );

  dioAdapter.onPost(
    '/echo/encrypt',
    (server) async => server.reply(
      200,
      jsonEncode(encryptedUserAccountResponse),
      delay: const Duration(seconds: 1),
    ),
    data: userAccount.toJson(),
  );

  dioAdapter.onPost(
    '/echo/decrypt',
    (server) async => server.reply(
      200,
      jsonEncode(decryptedBankAccountResponse),
      delay: const Duration(seconds: 1),
    ),
    data: encryptedBankAccountResponse['encryptedBankAccountSuccessResponse'],
  );
  ApiService apiService = ApiService(dio);

  group('ApiServiceTest', () {
    test(
      'Call getHelloWorld should respond with Hello, World!',
      () async {
        ApiService apiService = ApiService(dio);
        String response = await apiService.getHelloWorld();
        expect(response, "Hello, World!");
      },
    );
    test(
      'Call encrypt should respond with the encrypted value of the userAccount',
      () async {
        ApiService apiService = ApiService(dio);
        String response = await apiService.encryptValue(userAccount.toJson());
        expect(response, encryptedUserAccountResponse['encryptedResponse']);
      },
    );
    test(
      'Call createAccount should respond the encrypted value of the bankAccount',
      () async {
        ApiService apiService = ApiService(dio);
        String response = await apiService
            .createAccount(encryptedUserAccountResponse['encryptedResponse']);
        expect(response, encryptedBankAccountResponse['encryptedResponse']);
      },
    );
    test(
      'Call decrypt should respond with the encrypted value of the userAccount',
      () async {
        ApiService apiService = ApiService(dio);
        BankAccount response = await apiService
            .decryptValue(encryptedBankAccountResponse['encryptedResponse']);
        expect(response, bankAccount);
      },
    );
  });
}
