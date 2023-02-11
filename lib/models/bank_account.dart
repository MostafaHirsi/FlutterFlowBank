import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bank_account.g.dart';

@JsonSerializable()
class BankAccount extends Equatable {
  final String accountNumber;

  BankAccount(this.accountNumber);

  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);

  @override
  List<Object> get props => [accountNumber];
}
