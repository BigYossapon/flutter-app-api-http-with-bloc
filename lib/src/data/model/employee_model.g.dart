// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) =>
    EmployeeModel(
      name: json['Name'] as String,
      phone: json['Phone'] as String,
      address: json['Address'] as String,
      position: json['Position'] as String,
      mail: json['Mail'] as String,
      imageEmployee: json['Image_employee'] as String,
    );

Map<String, dynamic> _$EmployeeModelToJson(EmployeeModel instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Phone': instance.phone,
      'Address': instance.address,
      'Position': instance.position,
      'Mail': instance.mail,
      'Image_employee': instance.imageEmployee,
    };
