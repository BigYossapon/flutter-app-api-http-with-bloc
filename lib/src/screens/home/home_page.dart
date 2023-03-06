import 'package:flutter/material.dart';
import 'package:flutter_app_test01/src/screens/home/components/employee_listview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_route.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoute.addemployeedata),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: employeeListview());
  }
}
