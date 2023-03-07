part of 'image_picker_bloc.dart';

abstract class ImagePickerState extends Equatable {
  @override
  List<Object> get props => [];
}

class ImagePickerSelectingState extends ImagePickerState {}

class ImagePickerSelectedState extends ImagePickerState {
  final File uploadImage;
  ImagePickerSelectedState(this.uploadImage);
}

class ImagePickerErrorState extends ImagePickerState {}
