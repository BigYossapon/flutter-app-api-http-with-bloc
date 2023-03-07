part of 'image_add_bloc_bloc.dart';

abstract class ImageAddBlocEvent extends Equatable {
  const ImageAddBlocEvent();
}

class AddImageEvent extends ImageAddBlocEvent {
  @override
  List<Object> get props => [];
}
