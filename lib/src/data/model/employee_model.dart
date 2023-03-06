// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

EmployeeModel employeeModelFromJson(String str) =>
    EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
  EmployeeModel({
    required this.name,
    required this.phone,
    required this.address,
    required this.position,
    required this.mail,
    required this.imageEmployee,
  });

  String name;
  String phone;
  String address;
  String position;
  String mail;
  String imageEmployee;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        name: json["Name"],
        phone: json["Phone"],
        address: json["Address"],
        position: json["Position"],
        mail: json["Mail"],
        imageEmployee: json["Image_employee"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Phone": phone,
        "Address": address,
        "Position": position,
        "Mail": mail,
        "Image_employee": imageEmployee,
      };
}
