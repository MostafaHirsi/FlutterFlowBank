part of 'onboard_bloc.dart';

abstract class OnboardState extends Equatable {
  final List<Object> restProps;
  const OnboardState(this.restProps);

  @override
  List<Object> get props => restProps;
}

class OnboardInitial extends OnboardState {
  OnboardInitial() : super([]);
}

class OnboardLoading extends OnboardState {
  OnboardLoading() : super([]);
}

class OnboardSuccess extends OnboardState {
  final BankAccount bankAccount;

  OnboardSuccess(this.bankAccount) : super([bankAccount]);
}

class OnboardError extends OnboardState {
  final String error;

  OnboardError(this.error) : super([error]);
}
