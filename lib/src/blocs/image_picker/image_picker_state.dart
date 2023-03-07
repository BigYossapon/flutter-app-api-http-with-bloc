part of 'image_picker_bloc.dart';

abstract class ImagePickerState extends Equatable {
  @override
  List<Object> get props => [];
}

class ImagePickerPickingState extends ImagePickerState {
  @override
  List<Object> get props => [];
}

class ImagePickerPickedState extends ImagePickerState {
  final File file;
  ImagePickerPickedState(this.file);
  @override
  List<Object> get props => [file];
}

class ImagePickerErrorState extends ImagePickerState {
  late final String error;
  @override
  List<Object> get props => [error];
}
