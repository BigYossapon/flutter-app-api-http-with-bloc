part of 'image_add_bloc_bloc.dart';

abstract class ImageAddBlocState extends Equatable {}

class ImageAddingState extends ImageAddBlocState {
  @override
  List<Object> get props => [];
}

class ImageAddedState extends ImageAddBlocState {
  @override
  List<Object> get props => [];
}

class ImageAddErrorState extends ImageAddBlocState {
  late final String error;
  @override
  List<Object> get props => [this.error];
}
