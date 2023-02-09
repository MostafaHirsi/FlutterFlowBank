// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      json['firstname'] as String,
      json['middlename'] as String,
      json['lastname'] as String,
      DateTime.parse(json['dateOfBirth'] as String),
      json['gender'] as String,
      (json['dependents'] as List<dynamic>)
          .map((e) => Dependent.fromJson(e as Map<String, dynamic>))
          .toList(),
      Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'firstname': instance.firstname,
      'middlename': instance.middlename,
      'lastname': instance.lastname,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'gender': instance.gender,
      'dependents': instance.dependents,
      'address': instance.address,
    };
