import 'dart:convert';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test01/components/dialog_select.dart';
import 'package:flutter_app_test01/src/blocs/api/employees_data_bloc/delete/employeedatadelete_bloc.dart';
import 'package:flutter_app_test01/src/blocs/api/employees_data_bloc/post/employeedataadd_bloc.dart';
import 'package:flutter_app_test01/src/screens/adduser/add_employeedata_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../main.dart';
import '../../../app_route.dart';
import '../../../blocs/api/employees_data_bloc/get/employees/employeesdataget_bloc.dart';

import '../../../data/model/employee_model.dart';
import '../../../data/repository/employee_repository.dart';
import '../../../res/string.dart';

class EmployeeListview extends StatelessWidget {
  const EmployeeListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeesdatagetBloc, EmployeesdatagetState>(
        builder: (contextget, stateget) {
      if (stateget is EmployeesDataLoadingState) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Detail Employees"),
              actions: [
                IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddUserDataPage(contextget)),
                  ),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ));
      }
      if (stateget is EmployeesDataLoadedState) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Detail Employees"),
              actions: [
                IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddUserDataPage(contextget)),
                  ),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            body: RefreshIndicator(
                onRefresh: () async {
                  contextget
                      .read<EmployeesdatagetBloc>()
                      .add(LoadEmployeesdataEvent());
                },
                child: BlocConsumer<EmployeedatadeleteBloc,
                        EmployeedatadeleteState>(
                    listener: (contextdelete, statedelete) {
                  if (statedelete is EmployeedatadeletedState) {
                    Fluttertoast.showToast(
                        msg: statedelete.status,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    contextget
                        .read<EmployeesdatagetBloc>()
                        .add(LoadEmployeesdataEvent());
                  }
                  if (statedelete is EmployeedatadeleteErrorState) {
                    Fluttertoast.showToast(
                        msg: statedelete.status,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                }, builder: (contextdelete, statedelete) {
                  if (statedelete is EmployeedatadeletedState) {
                  } else if (statedelete is EmployeedatadeleteErrorState) {}

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
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
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
                                  backgroundImage: AssetImage(
                                      'assets/images/placeholder.jpg'),
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
                                      contextget,
                                      employeeList[index].id,
                                      employeeList[index].name,
                                      employeeList[index].mail,
                                      employeeList[index].address,
                                      employeeList[index].phone,
                                      employeeList[index].position,
                                      AppStrings.employeedomain +
                                          'uploads/' +
                                          employeeList[index]
                                              .imageEmployee
                                              .toString());
                                },
                              ),
                            ),
                          );
                        });
                  }

                  return Container();
                })));
      }
      return Scaffold(
          appBar: AppBar(
            title: Text("Detail Employees"),
            actions: [
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddUserDataPage(contextget)),
                ),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: Container());
    });
  }
}

Future<void> _dialogBuilder(
    BuildContext buildcontextdelete,
    BuildContext buildContextget,
    int? id,
    String? name,
    String? mail,
    String? address,
    String? phone,
    String? position,
    String? baseImage) {
  return showDialog<void>(
    context: buildcontextdelete,
    builder: (BuildContext context) {
      return DialogSelect(buildcontextdelete, buildContextget, id, name, mail,
          address, phone, position, baseImage);
    },
  );
}
