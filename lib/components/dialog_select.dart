import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_app_test01/src/blocs/api/employees_data_bloc/delete/employeedatadelete_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../src/app_route.dart';

class DialogSelect extends StatelessWidget {
  BuildContext buildContext;
  int? id;

  DialogSelect(this.buildContext, this.id, {Key? key}) : super(key: key);

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

            Navigator.pushNamed(context, AppRoute.editemployeedata);
          },
          child: Text('Edit data : $id'),
        ),
        SimpleDialogOption(
          onPressed: () {
            buildContext
                .read<EmployeedatadeleteBloc>()
                .add(DeleteEmployeedataEvent(id!));
            Navigator.pop(context);
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
