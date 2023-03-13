part of 'employeedataadd_bloc.dart';

abstract class EmployeedataaddEvent extends Equatable {
  const EmployeedataaddEvent();
}

class AddEmployeedataEvent extends EmployeedataaddEvent {
  EmployeeModel employeeModel;

  AddEmployeedataEvent(
    this.employeeModel,
  );

  @override
  List<Object> get props => [];
}
