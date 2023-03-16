import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_test01/src/blocs/image_picker/image_picker_bloc.dart';

import 'package:flutter_app_test01/src/screens/adduser/components/image_picker_form_add.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../app_route.dart';
import '../../blocs/api/employees_data_bloc/post/employeedataadd_bloc.dart';
import '../../data/repository/employee_repository.dart';

class AddUserDataPage extends StatelessWidget {
  const AddUserDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController mail = TextEditingController();
    TextEditingController address = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController position = TextEditingController();
    final imagePickerBloc = BlocProvider<ImagePickerBloc>(
        create: (BuildContext context) => ImagePickerBloc());
    final employeeDatapostBloc = BlocProvider<EmployeedataaddBloc>(
        create: (BuildContext context) =>
            EmployeedataaddBloc(EmployeeRepository()));
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Empployee Data"),
        ),
        body: MultiBlocProvider(
            providers: [imagePickerBloc, employeeDatapostBloc],
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: name,
                      autofocus: true,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        labelText: 'Enter Name',
                        hintText: 'Name',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: mail,
                      autofocus: true,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        labelText: 'Enter Mail',
                        hintText: 'Mail',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: phone,
                      autofocus: true,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        labelText: 'Enter Phone',
                        hintText: 'Phone',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: address,
                      autofocus: true,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        labelText: 'Enter Address',
                        hintText: 'Address',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: position,
                      autofocus: true,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        labelText: 'Enter Position',
                        hintText: 'Position',
                      ),
                    ),
                  ),
                  BlocBuilder<ImagePickerBloc, ImagePickerState>(
                    builder: (context, state) {
                      if (state is ImagePickerPickedState) {
                        return Column(
                          children: [
                            ImagePickerFormAdd(
                                context,
                                state.file,
                                name.text,
                                mail.text,
                                address.text,
                                phone.text,
                                position.text),
                          ],
                        );
                      }
                      return ImagePickerFormAdd(
                          context, null, null, null, null, null, null);
                    },
                  )
                ],
              ),
            )));
  }
}
