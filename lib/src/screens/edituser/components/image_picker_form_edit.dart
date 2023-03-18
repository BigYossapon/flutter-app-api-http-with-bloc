import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_app_test01/src/blocs/api/employees_data_bloc/get/employees/employeesdataget_bloc.dart';
import 'package:flutter_app_test01/src/blocs/api/employees_data_bloc/post/employeedataadd_bloc.dart';
import 'package:flutter_app_test01/src/blocs/image_picker/image_picker_bloc.dart';
import 'package:flutter_app_test01/src/data/model/employee_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../main.dart';
import '../../../blocs/api/employees_data_bloc/put/employeedataedit_bloc.dart';

class ImagePickerFormEdit extends StatelessWidget {
  final BuildContext buildContextget;
  final BuildContext buildContext;
  final int? id;
  final File? file;
  final String? name;
  final String? mail;
  final String? address;
  final String? phone;
  final String? position;
  final String? baseImage;

  ImagePickerFormEdit(
      this.buildContextget,
      this.id,
      this.buildContext,
      this.file,
      this.name,
      this.mail,
      this.address,
      this.phone,
      this.position,
      this.baseImage,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: file == null
                ? SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.network(baseImage!),
                  )
                : SizedBox(
                    height: 150,
                    child: Image.file(file!),
                  )),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                  onPressed: () {
                    print("press gallery");
                    requestGalleryPermission(buildContext);
                  },
                  icon: const Icon(Icons.browse_gallery),
                  label: const Text('choose image from gallery')),
            ),
            Expanded(
              child: ElevatedButton.icon(
                  onPressed: () {
                    print("press camera");
                    requestCameraPermission(buildContext);
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text('choose image from camera')),
            )
          ],
        ),
        //bloc edit data
        BlocConsumer<EmployeedataeditBloc, EmployeedataeditState>(
            listener: (contextedit, stateedit) {
          if (stateedit is EmployeedataeditedState) {
            buildContextget
                .read<EmployeesdatagetBloc>()
                .add(LoadEmployeesdataEvent());
          }
        }, builder: (contextedit, state) {
          if (state is EmployeedataeditedState) {
            // final SnackBar snackBar = SnackBar(content: Text(state.status));
            // snackbarKey.currentState?.showSnackBar(snackBar);
            Navigator.pop(context);
          }
          if (state is EmployeedataeditErrorState) {
            // final SnackBar snackBar = SnackBar(content: Text(state.status));
            // snackbarKey.currentState?.showSnackBar(snackBar);
          }
          return ElevatedButton.icon(
              onPressed: () {
                contextedit.read<EmployeedataeditBloc>().add(
                    EditEmployeedataEvent(
                        id!, name!, mail!, address!, phone!, position!, file));
                Navigator.pop(context);
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit data'));
        }),
      ],
    );
  }
}

Future requestCameraPermission(BuildContext buildContext) async {
  /// status can either be: granted, denied, restricted or permanentlyDenied
  var status = await Permission.camera.status;
  if (status.isGranted) {
    print("Permission is granted");
    pickImage(ImageSource.gallery, buildContext);
  } else if (status.isDenied) {
    // We didn't ask for permission yet or the permission has been denied before but not permanently.
    if (await Permission.camera.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      print("Permission was granted");
    }
  }
}

Future requestGalleryPermission(BuildContext buildContext) async {
  /// status can either be: granted, denied, restricted or permanentlyDenied
  var status = await Permission.storage.status;
  if (status.isGranted) {
    print("Permission is granted");
    pickImage(ImageSource.gallery, buildContext);
  } else if (status.isDenied) {
    // We didn't ask for permission yet or the permission has been denied before but not permanently.
    if (await Permission.storage.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      print("Permission was granted");
    }
  }
}

Future pickImage(ImageSource imageSource, BuildContext buildContext) async {
  try {
    final uploadImage = await ImagePicker().pickImage(source: imageSource);
    if (uploadImage == null) return;
    final imageTemp = File(uploadImage.path);
    buildContext.read<ImagePickerBloc>().add(ImagePickerPickEvent(imageTemp));
  } on PlatformException catch (e) {
    print('Failed to pick image: $e');
  }
}
