import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    File? uploadImage;
    Future<void> pickImage() async {
      try {
        var chooseImage =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (uploadImage == null) return;
        uploadImage = File(chooseImage!.path);
      } on PlatformException catch (e) {
        print('Failed to pick image: $e');
      }
    }

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
              Container(
                  child: uploadImage == null
                      ? Container()
                      : SizedBox(
                          height: 150,
                          child: Image.file(uploadImage!),
                        )),
              ElevatedButton.icon(
                  onPressed: () {
                    pickImage();
                  },
                  icon: const Icon(Icons.folder_open),
                  label: const Text('choose image')),
              Container(
                  child: uploadImage == null
                      ? Container()
                      : ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.upload_file),
                          label: const Text('upload data'))),
            ],
          ),
        ));
  }
}
