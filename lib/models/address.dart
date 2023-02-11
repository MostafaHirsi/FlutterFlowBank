import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address extends Equatable {
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

  @override
  List<Object> get props =>
      [addressLine1, addressLine2, city, stateProvince, country, zipPostalCode];

  Address copyWith({
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? stateProvince,
    String? country,
    String? zipPostalCode,
  }) {
    return Address(
      addressLine1 ?? this.addressLine1,
      addressLine2 ?? this.addressLine2,
      city ?? this.city,
      stateProvince ?? this.stateProvince,
      country ?? this.country,
      zipPostalCode ?? this.zipPostalCode,
    );
  }
}
