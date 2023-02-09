// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      json['addressLine1'] as String,
      json['addressLine2'] as String,
      json['city'] as String,
      json['stateProvince'] as String,
      json['country'] as String,
      json['zipPostalCode'] as String,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'city': instance.city,
      'stateProvince': instance.stateProvince,
      'country': instance.country,
      'zipPostalCode': instance.zipPostalCode,
    };
