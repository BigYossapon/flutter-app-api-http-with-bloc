import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(ImagePickerPickingState()) {
    on<ImagePickerPickEvent>((event, emit) {
      // TODO: implement event handler

      Future pickImage() async {
        try {
          final uploadImage =
              await ImagePicker().pickImage(source: event.imageSource);
          if (uploadImage == null) return;
          final imageTemp = File(uploadImage.path);
          emit(ImagePickerPickedState(imageTemp));
        } on PlatformException catch (e) {
          print('Failed to pick image: $e');
        }
      }
    });
  }
}
