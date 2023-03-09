import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyWidget extends StatelessWidget {
  String Name;
  String Mail;
  String Address;
  String Phone;
  String Position;
  String BaseImage;
  File file;

  MyWidget(this.Name, this.Mail, this.Address, this.Phone, this.Position,
      this.BaseImage, this.file,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: file == null
            ? Container()
            : ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.upload_file),
                label: const Text('upload data')));
  }
}
