import 'package:flutter/material.dart';
import 'package:flutter_app_test01/src/screens/edituser/components/image_picker_form_edit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_route.dart';
import '../../blocs/api/employees_data_bloc/put/employeedataedit_bloc.dart';
import '../../blocs/image_picker/image_picker_bloc.dart';
import '../../data/repository/employee_repository.dart';

class EditEmployeeDataPage extends StatelessWidget {
  final BuildContext buildContextget;
  final int? id;
  final String? name;
  final String? mail;
  final String? address;
  final String? phone;
  final String? position;
  final String? baseImage;

  EditEmployeeDataPage(this.buildContextget, this.id, this.name, this.mail,
      this.address, this.phone, this.position, this.baseImage,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imagePickerBloc = BlocProvider<ImagePickerBloc>(
        create: (BuildContext context) => ImagePickerBloc());
    final employeeDataputBloc = BlocProvider<EmployeedataeditBloc>(
        create: (BuildContext context) =>
            EmployeedataeditBloc(EmployeeRepository()));
    //set comtroller text

    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Employee Data : $id"),
        ),
        body: MultiBlocProvider(
            providers: [imagePickerBloc, employeeDataputBloc],
            child: Formdata(buildContextget, id, name, mail, address, phone,
                position, baseImage)));
  }
}

class Formdata extends StatefulWidget {
  final BuildContext buildContextget;
  final int? id;
  final String? name;
  final String? mail;
  final String? address;
  final String? phone;
  final String? position;
  final String? baseImage;

  const Formdata(this.buildContextget, this.id, this.name, this.mail,
      this.address, this.phone, this.position, this.baseImage,
      {Key? key})
      : super(key: key);

  @override
  State<Formdata> createState() => _FormdataState();
}

class _FormdataState extends State<Formdata> {
  TextEditingController c_name = TextEditingController();
  TextEditingController c_mail = TextEditingController();
  TextEditingController c_address = TextEditingController();
  TextEditingController c_phone = TextEditingController();
  TextEditingController c_position = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    c_name.text = widget.name!;
    c_mail.text = widget.mail!;
    c_address.text = widget.address!;
    c_phone.text = widget.phone!;
    c_position.text = widget.position!;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: c_name,
              autofocus: true,
              maxLines: 2,
              keyboardType: TextInputType.text,
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
              keyboardType: TextInputType.text,
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
              keyboardType: TextInputType.text,
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
              keyboardType: TextInputType.text,
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
              keyboardType: TextInputType.text,
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
                    ImagePickerFormEdit(
                        contextpick,
                        widget.buildContextget,
                        widget.id,
                        statepick.file,
                        c_name.text,
                        c_mail.text,
                        c_address.text,
                        c_phone.text,
                        c_position.text,
                        widget.baseImage),
                  ],
                );
              }

              return ImagePickerFormEdit(
                  contextpick,
                  widget.buildContextget,
                  widget.id,
                  null,
                  c_name.text,
                  c_mail.text,
                  c_address.text,
                  c_phone.text,
                  c_position.text,
                  widget.baseImage);
            },
          )
        ],
      ),
    );
  }
}
