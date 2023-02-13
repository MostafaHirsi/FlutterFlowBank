part of 'onboard_bloc.dart';

abstract class OnboardEvent extends Equatable {
  final List<Object> restProps;
  const OnboardEvent(this.restProps);

  @override
  List<Object> get props => [restProps];
}

class CommitOnboarding extends OnboardEvent {
  final UserAccount account;

  CommitOnboarding(this.account) : super([account]);
}
