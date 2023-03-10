// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'employee_model.g.dart';

@JsonSerializable()
class EmployeeModel {
  String name;
  String phone;
  String address;
  String position;
  String mail;
  String imageEmployee;

  EmployeeModel({
    required this.name,
    required this.phone,
    required this.address,
    required this.position,
    required this.mail,
    required this.imageEmployee,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeModelToJson(this);
}
