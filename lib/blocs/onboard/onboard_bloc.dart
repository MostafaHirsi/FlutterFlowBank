import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_flow_bank/models/address.dart';
import 'package:flutter_flow_bank/models/dependent.dart';
import 'package:flutter_flow_bank/models/user_account.dart';
import 'package:flutter_flow_bank/models/bank_account.dart';
import 'package:flutter_flow_bank/services/api_service.dart';

part 'onboard_event.dart';
part 'onboard_state.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  final ApiService apiService;
  OnboardBloc(this.apiService) : super(OnboardInitial()) {
    on<OnboardEvent>((event, emit) async {
      emit(OnboardLoading());
      try {
        if (event is CommitOnboarding) {
          String encryptedValueResponse =
              await apiService.encryptValue(event.account.toJson());
          String encryptedBankAccountResponse =
              await apiService.createAccount(encryptedValueResponse);
          BankAccount bankAccount =
              await apiService.decryptValue(encryptedBankAccountResponse);
          emit(OnboardSuccess(bankAccount));
        }
      } on DioError catch (dioError) {
        switch (dioError.response!.statusCode) {
          case 403:
            emit(OnboardError(
                "Seems like you missed something out, please enter valid entries into the fields"));
            break;
          case 500:
          default:
            emit(OnboardError(
                "Seems like something went wrong, please try again later"));
            break;
        }
      } catch (error) {
        emit(OnboardError(
            "Seems like something went wrong, please try again later"));
      }
    });
  }
}
