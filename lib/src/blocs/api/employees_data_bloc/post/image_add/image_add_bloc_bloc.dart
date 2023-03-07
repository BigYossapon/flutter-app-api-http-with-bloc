import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'image_add_bloc_event.dart';
part 'image_add_bloc_state.dart';

class ImageAddBlocBloc extends Bloc<ImageAddBlocEvent, ImageAddBlocState> {
  ImageAddBlocBloc() : super(ImageAddingState()) {
    on<ImageAddBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
