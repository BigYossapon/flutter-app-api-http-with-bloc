part of 'employeedataedit_bloc.dart';

abstract class EmployeedataeditState extends Equatable {
  const EmployeedataeditState();

  @override
  List<Object> get props => [];
}

class EmployeedataeditingState extends EmployeedataeditState {
  @override
  List<Object> get props => [];
}

class EmployeedataeditedState extends EmployeedataeditState {
  @override
  List<Object> get props => [];
}

class EmployeedataeditErrorState extends EmployeedataeditState {
  String error;
  EmployeedataeditErrorState(this.error);

  @override
  List<Object> get props => [error];
}
