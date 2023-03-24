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
  final BuildContext buildContextget;
  AddUserDataPage(this.buildContextget, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Formdata(buildContextget)));
  }
}

class Formdata extends StatefulWidget {
  final BuildContext buildContextget;
  const Formdata(this.buildContextget, {Key? key}) : super(key: key);

  @override
  State<Formdata> createState() => _FormdataState();
}

class _FormdataState extends State<Formdata> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController c_name = TextEditingController();
  TextEditingController c_mail = TextEditingController();
  TextEditingController c_address = TextEditingController();
  TextEditingController c_phone = TextEditingController();
  TextEditingController c_position = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: c_name,
              autofocus: false,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Enter Name',
                hintText: 'Name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Name';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  c_name.text = value;
                });
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: c_mail,
              autofocus: false,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Enter Mail',
                hintText: 'Mail',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Mail';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  c_mail.text = value;
                });
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: c_phone,
              autofocus: false,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Enter Phone',
                hintText: 'Phone',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Phone';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  c_phone.text = value;
                });
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: c_address,
              autofocus: false,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Enter Address',
                hintText: 'Address',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Address';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  c_address.text = value;
                });
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: c_position,
              autofocus: false,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Enter Position',
                hintText: 'Position',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Position';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  c_position.text = value;
                });
              },
            ),
          ),
          BlocBuilder<ImagePickerBloc, ImagePickerState>(
            builder: (contextpick, statepick) {
              if (statepick is ImagePickerPickedState) {
                return Column(
                  children: [
                    ImagePickerFormAdd(
                        contextpick,
                        widget.buildContextget,
                        statepick.file,
                        c_name.text,
                        c_mail.text,
                        c_address.text,
                        c_phone.text,
                        c_position.text),
                  ],
                );
              }

              return ImagePickerFormAdd(
                  contextpick, context, null, null, null, null, null, null);
            },
          )
        ],
      ),
    ));
  }
}
