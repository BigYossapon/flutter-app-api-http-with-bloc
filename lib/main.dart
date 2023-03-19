import 'package:flutter/material.dart';
import 'package:flutter_app_test01/src/app_route.dart';
import 'package:flutter_app_test01/src/blocs/api/employees_data_bloc/get/employees/employeesdataget_bloc.dart';
import 'package:flutter_app_test01/src/blocs/api/employees_data_bloc/post/employeedataadd_bloc.dart';
import 'package:flutter_app_test01/src/blocs/app_bloc_observe.dart';
import 'package:flutter_app_test01/src/blocs/image_picker/image_picker_bloc.dart';
import 'package:flutter_app_test01/src/data/repository/employee_repository.dart';
import 'package:flutter_app_test01/src/screens/home/home_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  //runApp(const MyApp());

  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter api with bloc',
      routes: AppRoute().getAll,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
