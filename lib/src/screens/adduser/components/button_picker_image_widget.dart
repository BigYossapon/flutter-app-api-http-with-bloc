import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../blocs/image_picker/image_picker_bloc.dart';

class Buttonpickerimagewidget extends StatelessWidget {
  BuildContext buildContext;
  Buttonpickerimagewidget(this.buildContext, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
              onPressed: () {
                buildContext
                    .read<ImagePickerBloc>()
                    .add(ImagePickerPickEvent(ImageSource.gallery));
              },
              icon: const Icon(Icons.browse_gallery),
              label: const Text('choose image from gallery')),
        ),
        Expanded(
          child: ElevatedButton.icon(
              onPressed: () {
                buildContext
                    .read<ImagePickerBloc>()
                    .add(ImagePickerPickEvent(ImageSource.camera));
              },
              icon: const Icon(Icons.camera),
              label: const Text('choose image from camera')),
        )
      ],
    );
  }
}
