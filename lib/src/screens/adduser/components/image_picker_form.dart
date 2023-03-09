import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_app_test01/src/blocs/image_picker/image_picker_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerForm extends StatelessWidget {
  BuildContext buildContext;
  File file;

  ImagePickerForm(this.buildContext, this.file, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: file == null
                ? Container()
                : SizedBox(
                    height: 150,
                    child: Image.file(file),
                  )),
        Row(
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  buildContext
                      .read<ImagePickerBloc>()
                      .add(ImagePickerPickEvent(ImageSource.gallery));
                },
                icon: const Icon(Icons.browse_gallery),
                label: const Text('choose image from gallery')),
            ElevatedButton.icon(
                onPressed: () {
                  buildContext
                      .read<ImagePickerBloc>()
                      .add(ImagePickerPickEvent(ImageSource.camera));
                },
                icon: const Icon(Icons.camera),
                label: const Text('choose image from camera')),
          ],
        ),
        Container(
            child: file == null
                ? Container()
                : ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.upload_file),
                    label: const Text('upload data'))),
      ],
    );
  }
}
