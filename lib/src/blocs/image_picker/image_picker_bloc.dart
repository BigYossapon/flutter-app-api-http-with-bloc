import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(ImagePickerChoosingState()) {
    on<ImagePickerChooseEvent>((event, emit) {
      File? uploadImage;
      // TODO: implement event handler
      Future<void> pickImagegallery() async {
        try {
          var chooseImage =
              await ImagePicker().pickImage(source: event.fileSource);
          if (uploadImage == null) return;
          uploadImage = File(chooseImage!.path);
        } on PlatformException catch (e) {
          print('Failed to pick image: $e');
        }
      }
    });
  }
}
