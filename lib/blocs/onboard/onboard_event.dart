part of 'onboard_bloc.dart';

abstract class OnboardEvent extends Equatable {
  const OnboardEvent();
}

class CommitOnboarding extends OnboardEvent {
  final UserAccount account;

  CommitOnboarding(this.account);

  @override
  List<Object> get props => [account];
}
