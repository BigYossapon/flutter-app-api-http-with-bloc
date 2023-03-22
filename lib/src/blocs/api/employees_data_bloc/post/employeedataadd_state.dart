part of 'employeedataadd_bloc.dart';

abstract class EmployeedataaddState extends Equatable {}

class EmployeedataaddingState extends EmployeedataaddState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EmployeedataaddedState extends EmployeedataaddState {
  String status;
  EmployeedataaddedState(this.status);
  @override
  // TODO: implement props
  List<Object?> get props => [status];
}

class EmployeedataErrorState extends EmployeedataaddState {
  late final String status;
  EmployeedataErrorState(this.status);

  @override
  // TODO: implement props
  List<Object?> get props => [status];
}
