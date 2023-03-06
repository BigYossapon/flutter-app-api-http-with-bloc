import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_test01/src/data/model/employee_model.dart';
import 'package:flutter_app_test01/src/data/repository/employee_repository.dart';
import 'package:meta/meta.dart';

part 'employeesdataget_event.dart';
part 'employeesdataget_state.dart';

class EmployeesdatagetBloc
    extends Bloc<EmployeesdatagetEvent, EmployeesdatagetState> {
  final EmployeeRepository _employeeRepository;
  EmployeesdatagetBloc(this._employeeRepository)
      : super(EmployeesDataLoadingState()) {
    on<LoadEmployeesdataEvent>((event, emit) async {
      emit(EmployeesDataLoadingState());
      try {
        final employees = await _employeeRepository.getEmployeeData();
        emit(EmployeesDataLoadedState(employees));
      } catch (e) {
        emit(EmployeesDataErrorState(e.toString()));
      }
    });
  }
}
