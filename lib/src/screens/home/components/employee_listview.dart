import 'dart:convert';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test01/components/dialog_select.dart';
import 'package:flutter_app_test01/src/blocs/api/employees_data_bloc/delete/employeedatadelete_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/api/employees_data_bloc/get/employees/employeesdataget_bloc.dart';

import '../../../data/model/employee_model.dart';
import '../../../data/repository/employee_repository.dart';
import '../../../res/string.dart';

class employeeListview extends StatelessWidget {
  const employeeListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeesdatagetBloc, EmployeesdatagetState>(
        builder: (contextget, stateget) {
      return BlocBuilder<EmployeedatadeleteBloc, EmployeedatadeleteState>(
          builder: (contextdelete, statedelete) {
        if (stateget is EmployeesDataLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (stateget is EmployeesDataLoadedState) {
          List<EmployeeModel> employeeList = stateget.employees;
          return ListView.builder(
              itemCount: employeeList.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Card(
                    color: Theme.of(context).primaryColor,
                    child: ListTile(
                      title: Text(
                        '${employeeList[index].name}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Mail:${employeeList[index].mail}\nPhone:${employeeList[index].phone}\nAddress:${employeeList[index].address}\nPosition:${employeeList[index].position}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/placeholder.jpg'),
                        child: CircleAvatar(
                            radius: 65,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(
                                AppStrings.employeedomain +
                                    'uploads/' +
                                    employeeList[index]
                                        .imageEmployee
                                        .toString(),
                                headers: {
                                  "Content-type": "application/json",
                                  "Accept": "application/json",
                                })),
                      ),
                      onTap: () {
                        _dialogBuilder(
                            contextdelete,
                            employeeList[index].id,
                            employeeList[index].name,
                            employeeList[index].mail,
                            employeeList[index].address,
                            employeeList[index].phone,
                            employeeList[index].position,
                            AppStrings.employeedomain +
                                'uploads/' +
                                employeeList[index].imageEmployee.toString());
                      },
                    ),
                  ),
                );
              });
        }
        if (statedelete is EmployeedatadeletedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(statedelete.status),
          ));
        } else if (statedelete is EmployeedatadeleteErrorgState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(statedelete.error),
          ));
        }
        return const Text('error');
      });
    });
  }
}

Future<void> _dialogBuilder(
    BuildContext buildcontext,
    int? id,
    String? name,
    String? mail,
    String? address,
    String? phone,
    String? position,
    String? baseImage) {
  return showDialog<void>(
    context: buildcontext,
    builder: (BuildContext context) {
      return DialogSelect(
          buildcontext, id, name, mail, address, phone, position, baseImage);
    },
  );
}
