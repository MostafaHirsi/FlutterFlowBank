import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String stateProvince;
  final String country;
  final String zipPostalCode;

  Address(this.addressLine1, this.addressLine2, this.city, this.stateProvince,
      this.country, this.zipPostalCode);

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
