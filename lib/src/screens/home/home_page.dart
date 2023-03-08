import 'package:flutter/material.dart';
import 'package:flutter_app_test01/src/screens/home/components/employee_listview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_route.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Employees"),
          actions: [
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoute.addemployeedata),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: const employeeListview());
  }
}
