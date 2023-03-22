part of 'image_picker_bloc.dart';

abstract class ImagePickerState extends Equatable {
  const ImagePickerState();
  // final File file;

  // const ImagePickerState( {required File file});

  // ImagePickerState copyWith({File? file}) {
  //   return ImagePickerState(file: file ?? this.file);
  // }

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
}

class ImagePickerErrorState extends ImagePickerState {
  late final String error;
  @override
  List<Object> get props => [error];
}
