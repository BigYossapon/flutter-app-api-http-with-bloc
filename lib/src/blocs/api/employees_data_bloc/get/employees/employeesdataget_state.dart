part of 'employeesdataget_bloc.dart';

@immutable
abstract class EmployeesdatagetState extends Equatable {}

class EmployeesDataLoadingState extends EmployeesdatagetState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EmployeesDataLoadedState extends EmployeesdatagetState {
  final List<EmployeeModel> employees;
  EmployeesDataLoadedState(this.employees);
  @override
  // TODO: implement props
  List<Object?> get props => [employees];

  EmployeesDataLoadedState copyWith({List<EmployeeModel>? employees}) {
    return EmployeesDataLoadedState(employees ?? this.employees);
  }
}

class EmployeesDataErrorState extends EmployeesdatagetState {
  final String error;
  EmployeesDataErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
