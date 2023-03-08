import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_test01/src/blocs/image_picker/image_picker_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../app_route.dart';

class AddUserDataPage extends StatelessWidget {
  const AddUserDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController mail = TextEditingController();
    TextEditingController address = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController position = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: Text("Add Empployee Data"),
        ),
        body: SingleChildScrollView(
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
                        Container(
                            child: state.file == null
                                ? Container()
                                : SizedBox(
                                    height: 150,
                                    child: Image.file(state.file!),
                                  )),
                        Row(
                          children: [
                            ElevatedButton.icon(
                                onPressed: () {
                                  context
                                      .read<ImagePickerBloc>()
                                      .add(ImagePickerPickEvent());
                                },
                                icon: const Icon(Icons.browse_gallery),
                                label: const Text('choose image from gallery')),
                            ElevatedButton.icon(
                                onPressed: () {
                                  context
                                      .read<ImagePickerBloc>()
                                      .add(ImagePickerPickEvent());
                                },
                                icon: const Icon(Icons.camera),
                                label: const Text('choose image from camera')),
                          ],
                        ),
                        Container(
                            child: state.file == null
                                ? Container()
                                : ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(Icons.upload_file),
                                    label: const Text('upload data'))),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ));
  }
}
