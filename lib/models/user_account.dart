import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:flutter_flow_bank/models/address.dart';
import 'package:flutter_flow_bank/models/dependent.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_account.g.dart';

@JsonSerializable()
class UserAccount extends Equatable {
  final String firstName;
  final String middleName;
  final String lastName;
  final DateTime dateOfBirth;
  final String gender;
  final List<Dependent> dependents;
  final Address address;

  UserAccount(this.firstName, this.middleName, this.lastName, this.dateOfBirth,
      this.gender, this.dependents, this.address);

  factory UserAccount.fromJson(Map<String, dynamic> json) =>
      _$UserAccountFromJson(json);

  Map<String, dynamic> toJson() => _$UserAccountToJson(this);

  @override
  List<Object> get props => [
        firstName,
        middleName,
        lastName,
        dateOfBirth,
        gender,
        dependents,
        address
      ];

  UserAccount copyWith(
      {String? firstName,
      String? middleName,
      String? lastName,
      DateTime? dateOfBirth,
      String? gender,
      List<Dependent>? dependents,
      Address? address}) {
    return UserAccount(
        firstName ?? this.firstName,
        middleName ?? this.middleName,
        lastName ?? this.lastName,
        dateOfBirth ?? this.dateOfBirth,
        gender ?? this.gender,
        dependents ?? this.dependents,
        address ?? this.address);
  }
}
