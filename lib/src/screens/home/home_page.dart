import 'package:flutter/material.dart';
import 'package:flutter_app_test01/src/blocs/api/employees_data_bloc/delete/employeedatadelete_bloc.dart';
import 'package:flutter_app_test01/src/screens/home/components/employee_listview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_route.dart';
import '../../blocs/api/employees_data_bloc/get/employees/employeesdataget_bloc.dart';
import '../../data/repository/employee_repository.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final employeeDatagetBloc = BlocProvider<EmployeesdatagetBloc>(
        create: (BuildContext context) =>
            EmployeesdatagetBloc(EmployeeRepository())
              ..add(LoadEmployeesdataEvent()));
    final employeedatadeleteBloc = BlocProvider<EmployeedatadeleteBloc>(
        create: (BuildContext context) =>
            EmployeedatadeleteBloc(EmployeeRepository()));

    return MultiBlocProvider(
        providers: [employeeDatagetBloc, employeedatadeleteBloc],
        child: const EmployeeListview());
  }
}
