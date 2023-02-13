import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flow_bank/blocs/onboard/onboard_bloc.dart';
import 'package:flutter_flow_bank/pages/intro/intro_page.dart';
import 'package:flutter_flow_bank/pages/onboarding/onboarding_page.dart';
import 'package:flutter_flow_bank/services/api_service.dart';
import 'package:flutter_flow_bank/widgets/primary_button.dart';
import 'package:flutter_flow_bank/widgets/text_form_field.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../intro_page_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  testWidgets('Testing onboarding page with invalid information',
      (tester) async {
    ApiService apiService = MockApiService();
    OnboardBloc onboardBloc = OnboardBloc(apiService);
    Widget testWidget = MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        home: BlocProvider<OnboardBloc>(
          create: (context) => onboardBloc,
          child: OnboardingPage(),
        ),
      ),
    );
    await tester.pumpWidget(testWidget);

    await navigateToGenderStep(tester);
  });
}

Future<void> navigateToGenderStep(WidgetTester tester) async {
  final firstNameFinder = find.byKey(const Key("First name"));
  final middleNameFinder = find.byKey(const Key("Middle name"));
  final lastNameFinder = find.byKey(const Key("Last name"));

  await tester.enterText(firstNameFinder, 'Mostafa');
  await tester.enterText(middleNameFinder, 'Mahamud');
  await tester.enterText(lastNameFinder, 'Mahamud');

  final primaryButtonFinder = find.widgetWithText(PrimaryButton, "Continue");
  await tester.tap(primaryButtonFinder);
  await tester.pumpAndSettle();
}
