import 'dart:convert';
import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_flow_bank/blocs/onboard/onboard_bloc.dart';
import 'package:flutter_flow_bank/models/user_account.dart';
import 'package:flutter_flow_bank/models/address.dart';
import 'package:flutter_flow_bank/models/dependent.dart';
import 'package:flutter_flow_bank/services/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([ApiService])
void main() {
  final Dio dio = Dio();
  final DioAdapter dioAdapter = DioAdapter(
    dio: dio,
    matcher: const FullHttpRequestMatcher(),
  );

  UserAccount userAccount = UserAccount(
    "Mostafa",
    "Mahamud",
    "Hirsi",
    DateTime(1992, 9, 2),
    "male",
    [Dependent("Salma"), Dependent("Habon")],
    Address("Flat 1", "100 Main Road", "Middle City", "Middlelands",
        "United Kingdom", "MC3 2AD"),
  );

  print(userAccount.toJson());

  // const String createAccountRequest =
  //     "2sIbYPYjqwqoqYdiT7tif2X2riuUZFM5HaYUHHQKJAYtO4EPN72ViIR+gFZv/urHexAJqk0k7/n7/sBELQ4zmWi9pcu/qW5eVH1Tuxps+C" +
  //         "xxlhrkaW4AI/yrxqOksI2wySwcNbuwNyvvV96lAJTTZUIyFQODALBMt9QBwZn3g+i2J/EJU9GRQ5SXXt448rX5b896w0nuGzNjQwTJiUB" +
  //         "SPbulzNMaYGuSf8gf1jm2R6xxAiVYosqrGC4eErgvDAlYkhA0/a2/QEtAieZfTyG9cHUjY59Rfd1ZNkvxZjlBDdTfzGvNFC4uriax4md2c1sS";
  // const Map<String, dynamic> postAccountSuccessResponse = {
  //   "encryptedResponse": "vy+yX5sQ6c0XYI30E4n+gTAssc2omHYcuuWTkHLX3oQ="
  // };

  // const Map<String, dynamic> encryptValueRequest = {"hello": "World"};
  // const Map<String, dynamic> encryptValueResponse = {
  //   "encryptedResponse": "KX5by8icYBVUsmpWTh78jQxKoQT678/02ez2VFEJ5Yw="
  // };

  // const Map<String, dynamic> decryptValueRequest = {
  //   "encryptedResponse": "vy+yX5sQ6c0XYI30E4n+gZUELFAVRLwG08tmHmFJUMU="
  // };
  // const Map<String, dynamic> decryptValueResponse = {
  //   "accountNumber": "3377442"
  // };

  // dioAdapter.onPost(
  //   '/account',
  //   (server) async => server.reply(
  //     200,
  //     postAccountSuccessResponse,
  //     delay: const Duration(seconds: 1),
  //   ),
  //   data: createAccountRequest,
  // );

  // dioAdapter.onPost(
  //   '/encrypt',
  //   (server) async => server.reply(
  //     200,
  //     encryptValueResponse,
  //     delay: const Duration(seconds: 1),
  //   ),
  //   data: encryptValueRequest,
  // );

  // dioAdapter.onPost(
  //   '/decrypt',
  //   (server) async => server.reply(
  //     200,
  //     decryptValueResponse,
  //     delay: const Duration(seconds: 1),
  //   ),
  //   data: decryptValueRequest,
  // );
  // ApiService apiService = ApiService(dio);

  // group('onboardingBloc', () {
  //   blocTest<OnboardBloc, OnboardState>(
  //     'Empty State',
  //     build: () => OnboardBloc(apiService),
  //     expect: () => [],
  //   );
  //   blocTest<OnboardBloc, OnboardState>(
  //     'Add CommitSearchEvent to searchBloc with clefairy as search term, expect SearchComplete with one PokemonDetails object',
  //     build: () => OnboardBloc(apiService),
  //     act: (bloc) => bloc.add(
  //       CommitOnboarding("clefairy"),
  //     ),
  //     wait: Duration(
  //       seconds: 3,
  //     ),
  //     expect: () => [OnboardLoading(), OnboardComplete()],
  //   );
  //   blocTest<OnboardBloc, OnboardState>(
  //     'Add CommitSearchEvent to searchBloc with squirrel as search term, expect SearchComplete a null value for pokemonDetails',
  //     build: () => OnboardBloc(apiService),
  //     act: (bloc) => bloc.add(
  //       CommitSearchEvent("squirrel"),
  //     ),
  //     wait: Duration(
  //       seconds: 3,
  //     ),
  //     expect: () => [OnboardLoading(), OnboardError()],
  //   );
  // });
}

Future<Map<String, dynamic>> buildJson() async {
  final file = File('test/service/poke_api_service_test/clefairy.json');
  final json = jsonDecode(await file.readAsString());
  return json;
}
