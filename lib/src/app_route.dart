import 'package:flutter/cupertino.dart';
import 'package:flutter_app_test01/src/screens/adduser/add_employeedata_page.dart';
import 'package:flutter_app_test01/src/screens/edituser/edit_employeedata_page.dart';
import 'package:flutter_app_test01/src/screens/home/home_page.dart';

class AppRoute {
  static const home = 'home';
  static const addemployeedata = 'addemployeedata';
  static const editemployeedata = 'editemployeedata';

  final _route = <String, WidgetBuilder>{
    home: (context) => const MyHomePage(),
    addemployeedata: (context) => const AddUserDataPage(),
    editemployeedata: (context) => EditEmployeeDataPage()
  };

  get getAll => _route;
}
