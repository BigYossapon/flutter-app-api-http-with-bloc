import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_app_test01/src/blocs/api/employees_data_bloc/delete/employeedatadelete_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DialogSelect extends StatelessWidget {
  BuildContext buildContext;
  String? id;
  DialogSelect(this.buildContext, this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Select Setting'),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            buildContext
                .read<EmployeedatadeleteBloc>()
                .add(DeleteEmployeedataEvent(id!));
            Navigator.pop(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Edit Success")));
          },
          child: Text('Edit data'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Delete Success")));
          },
          child: Text('Delete data'),
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
