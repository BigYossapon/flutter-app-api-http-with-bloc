part of 'employeedataadd_bloc.dart';

abstract class EmployeedataaddState extends Equatable {}

class EmployeedataaddingState extends EmployeedataaddState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EmployeedataaddedState extends EmployeedataaddState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EmployeedataErrorState extends EmployeedataaddState {
  late final String error;
  EmployeedataErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
