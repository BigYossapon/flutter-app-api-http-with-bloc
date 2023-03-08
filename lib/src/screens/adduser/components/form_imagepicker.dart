import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FormImagePicker extends StatelessWidget {
  const FormImagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  context.read<ImagePickerBloc>().add(ImagePickerPickEvent());
                },
                icon: const Icon(Icons.browse_gallery),
                label: const Text('choose image from gallery')),
            ElevatedButton.icon(
                onPressed: () {
                  context.read<ImagePickerBloc>().add(ImagePickerPickEvent());
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
  }
}
