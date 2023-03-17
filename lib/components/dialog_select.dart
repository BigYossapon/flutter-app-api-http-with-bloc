import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_app_test01/src/blocs/api/employees_data_bloc/delete/employeedatadelete_bloc.dart';
import 'package:flutter_app_test01/src/blocs/api/employees_data_bloc/get/employees/employeesdataget_bloc.dart';
import 'package:flutter_app_test01/src/screens/edituser/edit_employeedata_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../src/app_route.dart';

class DialogSelect extends StatelessWidget {
  BuildContext buildContextdelete;
  BuildContext buildContextget;
  int? id;
  String? name;
  String? mail;
  String? address;
  String? phone;
  String? position;
  String? baseImage;

  DialogSelect(
      this.buildContextdelete,
      this.buildContextget,
      this.id,
      this.name,
      this.mail,
      this.address,
      this.phone,
      this.position,
      this.baseImage,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Select Setting : $id'),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            // buildContext
            //     .read<EmployeedatadeleteBloc>()
            //     .add(DeleteEmployeedataEvent(id!));
            Navigator.pop(context);
            Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (_) => EditEmployeeDataPage(
                        id, name, mail, address, phone, position, baseImage)))
                .then((_) {
              buildContextget
                  .read<EmployeesdatagetBloc>()
                  .add(LoadEmployeesdataEvent());
            });
            //Navigator.pushNamed(context, AppRoute.editemployeedata);
          },
          child: Text('Edit data : $id'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
            buildContextdelete
                .read<EmployeedatadeleteBloc>()
                .add(DeleteEmployeedataEvent(id!));
          },
          child: Text('Delete data : $id'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
