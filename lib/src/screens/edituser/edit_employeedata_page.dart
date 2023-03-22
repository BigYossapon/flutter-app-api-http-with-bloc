import 'package:flutter/material.dart';
import 'package:flutter_app_test01/src/screens/edituser/components/image_picker_form_edit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_route.dart';
import '../../blocs/api/employees_data_bloc/put/employeedataedit_bloc.dart';
import '../../blocs/image_picker/image_picker_bloc.dart';
import '../../data/repository/employee_repository.dart';

class EditEmployeeDataPage extends StatelessWidget {
  final int? id;
  final String? name;
  final String? mail;
  final String? address;
  final String? phone;
  final String? position;
  final String? baseImage;

  EditEmployeeDataPage(this.id, this.name, this.mail, this.address, this.phone,
      this.position, this.baseImage,
      {Key? key})
      : super(key: key);
  TextEditingController c_name = TextEditingController();
  TextEditingController c_mail = TextEditingController();
  TextEditingController c_address = TextEditingController();
  TextEditingController c_phone = TextEditingController();
  TextEditingController c_position = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final imagePickerBloc = BlocProvider<ImagePickerBloc>(
        create: (BuildContext context) => ImagePickerBloc());
    final employeeDataputBloc = BlocProvider<EmployeedataeditBloc>(
        create: (BuildContext context) =>
            EmployeedataeditBloc(EmployeeRepository()));
    //set comtroller text
    c_name.text = name!;
    c_mail.text = mail!;
    c_address.text = address!;
    c_phone.text = phone!;
    c_position.text = position!;
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Employee Data : $id"),
        ),
        body: MultiBlocProvider(
            providers: [imagePickerBloc, employeeDataputBloc],
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: c_name,
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
                      controller: c_mail,
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
                      controller: c_phone,
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
                      controller: c_address,
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
                      controller: c_position,
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
                            ImagePickerFormEdit(
                                context,
                                state.file,
                                c_name.text,
                                c_mail.text,
                                c_address.text,
                                c_phone.text,
                                c_position.text,
                                baseImage),
                          ],
                        );
                      }
                      return ImagePickerFormEdit(context, null, null, null,
                          null, null, null, baseImage);
                    },
                  )
                ],
              ),
            )));
  }
}
