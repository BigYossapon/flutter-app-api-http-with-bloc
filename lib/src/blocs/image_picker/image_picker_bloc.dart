import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(ImagePickerPickingState()) {
    on<ImagePickerPickEvent>((event, emit) {
      if (event.imageFile != null) {
        emit(ImagePickerPickedState(event.imageFile));
      } else {
        emit(ImagePickerErrorState());
      }

      // We didn't ask for permission yet or the permission has been denied before but not permanently.
    });
  }
}
