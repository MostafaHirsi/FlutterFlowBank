part of 'onboard_bloc.dart';

abstract class OnboardState extends Equatable {
  const OnboardState();
}

class OnboardInitial extends OnboardState {
  @override
  List<Object> get props => [];
}

class OnboardLoading extends OnboardState {
  @override
  List<Object> get props => [];
}

class OnboardSuccess extends OnboardState {
  final BankAccount bankAccount;

  const OnboardSuccess(this.bankAccount);

  @override
  List<Object> get props => [bankAccount];
}

class OnboardError extends OnboardState {
  final String error;

  const OnboardError(this.error);

  @override
  List<Object> get props => [error];
}
