part of 'employeedataadd_bloc.dart';

abstract class EmployeedataaddEvent extends Equatable {
  const EmployeedataaddEvent();
}

class AddEmployeedataEvent extends EmployeedataaddEvent {
  File file;

  AddEmployeedataEvent(
    this.file,
  );

  @override
  List<Object> get props => [];
}
