part of 'image_picker_bloc.dart';

abstract class ImagePickerState extends Equatable {
  const ImagePickerState();

  @override
  List<Object> get props => [];
}

class ImagePickerSelectingState extends ImagePickerState {}

class ImagePickerSelectedState extends ImagePickerState {}

class ImagePickerSelectErrorState extends ImagePickerState {}
