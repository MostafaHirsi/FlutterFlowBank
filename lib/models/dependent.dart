import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'dependent.g.dart';

@JsonSerializable()
class Dependent extends Equatable {
  final String name;

  Dependent(this.name);

  factory Dependent.fromJson(Map<String, dynamic> json) =>
      _$DependentFromJson(json);

  Map<String, dynamic> toJson() => _$DependentToJson(this);

  @override
  List<Object> get props => [name];
}
