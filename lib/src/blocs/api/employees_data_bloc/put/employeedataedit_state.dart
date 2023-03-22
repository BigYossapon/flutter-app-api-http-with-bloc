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
  String status;
  EmployeedataeditedState(this.status);
  @override
  List<Object> get props => [status];
}

class EmployeedataeditErrorState extends EmployeedataeditState {
  String status;
  EmployeedataeditErrorState(this.status);

  @override
  List<Object> get props => [status];
}
