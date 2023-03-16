import 'package:flutter/material.dart';
import 'package:flutter_app_test01/src/screens/edituser/components/image_picker_form_edit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_route.dart';
import '../../blocs/image_picker/image_picker_bloc.dart';
import 'components/button_picker_image__edit_widget.dart';

class EditEmployeeDataPage extends StatelessWidget {
  final int id;

  EditEmployeeDataPage(this.id, {Key? key}) : super(key: key);
  TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController position = TextEditingController();
  final imagePickerBloc = BlocProvider<ImagePickerBloc>(
      create: (BuildContext context) => ImagePickerBloc());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Employee Data"),
        ),
        body: MultiBlocProvider(
            providers: [imagePickerBloc],
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
                            ImagePickerFormEdit(
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
                      return Buttonpickerimageeditwidget(context);
                    },
                  )
                ],
              ),
            )));
  }
}
