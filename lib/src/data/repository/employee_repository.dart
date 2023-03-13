import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app_test01/src/data/model/employee_model.dart';
import 'package:flutter_app_test01/src/res/string.dart';
import 'package:http/http.dart' as http;

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

  @override
  Future<void> postEmployeeData(EmployeeModel employeeModel) async {
    String url = AppStrings.employeeUrl + 'add';
    final response = await http.post(Uri.parse(url),
        body: json.encode(employeeModel.toJson()));
    if (response.statusCode == 200) {
    } else {
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
