import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flow_bank/models/bank_account.dart';
import 'package:flutter_flow_bank/pages/success/success_page.dart';
import 'package:flutter_flow_bank/services/api_service.dart';
import 'package:injector/injector.dart';
import 'package:flutter_flow_bank/blocs/camera/camera_bloc.dart';
import 'package:flutter_flow_bank/blocs/onboard/onboard_bloc.dart';
import 'package:flutter_flow_bank/pages/intro/intro_page.dart';
import 'package:flutter_flow_bank/pages/onboarding/onboarding_page.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Dio dio = Dio();
  Injector.appInstance.registerDependency<Dio>(() => dio);
  Injector.appInstance.registerDependency<ApiService>(() => ApiService(dio));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService apiService = Injector.appInstance.get<ApiService>();
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF4B39EF),
          onPrimary: Colors.white,
          secondary: Color(0xFF13209E),
          onSecondary: Color(0xFF535353),
          error: Colors.red,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Color(0xFF4B39EF),
          surface: Colors.white,
          onSurface: Color(0xFF535353),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          actionsIconTheme: const IconThemeData(
            color: Color(0xFF4B39EF),
          ),
          titleTextStyle: const TextStyle(
              color: Color(0xFF4B39EF),
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.15),
          toolbarTextStyle:
              Theme.of(context).appBarTheme.toolbarTextStyle?.copyWith(
                    color: const Color(0xFF4B39EF),
                  ),
          iconTheme: const IconThemeData(
            color: Color(0xFF4B39EF),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey.shade400),
          prefixIconColor: Colors.grey.shade400,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                8,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                8,
              ),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF4B39EF),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                8,
              ),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: Spacing.s,
            vertical: Spacing.s,
          ),
        ),
      ),
      home: const IntroPage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case SuccessPage.routeName:
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                BankAccount bankAccount = settings.arguments as BankAccount;
                return SuccessPage(
                  bankAccount: bankAccount,
                );
              },
            );
          case OnboardingPage.routeName:
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => CameraBloc(),
                    ),
                    BlocProvider(
                      create: (context) => OnboardBloc(apiService),
                    ),
                  ],
                  child: OnboardingPage(),
                );
              },
            );
          case IntroPage.routeName:
          default:
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return const IntroPage();
              },
            );
        }
      },
    );
  }
}
