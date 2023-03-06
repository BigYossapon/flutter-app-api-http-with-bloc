import 'dart:convert';
import 'dart:developer';
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
}
