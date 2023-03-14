import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app_test01/src/data/model/employee_model.dart';
import 'package:flutter_app_test01/src/res/string.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class EmployeeRepository {
  @override
  Future<List<EmployeeModel>> getEmployeeData() async {
    String url = AppStrings.employeeUrl + 'get';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => EmployeeModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
      log("no model");
    }
  }
  // body: {
  //     "Name": name,
  //     "Mail": mail,
  //     "Address": address,
  //     "Phone": phone,
  //     "Position": postition,
  //     "Image_employee": await MultipartFile.fromPath('image', file.path),

  @override
  Future<void> postEmployeeData(String name, String mail, String address,
      String phone, String postition, File file) async {
    Map<String, String> body = {
      'Name': name,
      'Mail': mail,
      'Address': address,
      'Phone': phone,
      'Position': postition,
    };
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    String url = AppStrings.employeeUrl + 'add';
    final request = await http.MultipartRequest('POST', Uri.parse(url))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files
          .add(await http.MultipartFile.fromPath('Image_employee', file.path));
    var response = await request.send();
    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
      log("no model");
    }
  }

  @override
  Future<void> putEmployeeData() async {
    String url = AppStrings.employeeUrl + 'edit/';
    final response = await http.post(Uri.parse(url));
    if (response.statusCode == 200) {
    } else {
      throw Exception(response.reasonPhrase);
      log("no model");
    }
  }

  @override
  Future<void> deleteEmployeeData() async {
    String url = AppStrings.employeeUrl + 'add';
    final response = await http.post(Uri.parse(url));
    if (response.statusCode == 200) {
      log(response.body);
    } else {
      throw Exception(response.reasonPhrase);
      log("no model");
    }
  }
}
