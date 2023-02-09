import 'dart:core';

import 'package:flutter_flow_bank/models/address.dart';
import 'package:flutter_flow_bank/models/dependent.dart';
import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';

@JsonSerializable()
class Account {
  final String firstname;
  final String middlename;
  final String lastname;
  final DateTime dateOfBirth;
  final String gender;
  final List<Dependent> dependents;
  final Address address;

  Account(this.firstname, this.middlename, this.lastname, this.dateOfBirth,
      this.gender, this.dependents, this.address);

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
