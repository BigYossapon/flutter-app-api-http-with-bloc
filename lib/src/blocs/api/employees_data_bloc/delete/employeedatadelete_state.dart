part of 'employeedatadelete_bloc.dart';

abstract class EmployeedatadeleteState extends Equatable {}

class EmployeedatadeletingState extends EmployeedatadeleteState {
  @override
  List<Object> get props => [];
}

class EmployeedatadeletedState extends EmployeedatadeleteState {
  @override
  List<Object> get props => [];
}

class EmployeedatadeleteErrorgState extends EmployeedatadeleteState {
  String error;
  EmployeedatadeleteErrorgState(this.error);
  @override
  List<Object> get props => [error];
}
