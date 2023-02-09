import 'package:json_annotation/json_annotation.dart';
part 'dependent.g.dart';

@JsonSerializable()
class Dependent {
  final String dependent;

  Dependent(this.dependent);

  factory Dependent.fromJson(Map<String, dynamic> json) =>
      _$DependentFromJson(json);

  Map<String, dynamic> toJson() => _$DependentToJson(this);
}
