import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_test01/src/data/repository/employee_repository.dart';

part 'employeedatadelete_event.dart';
part 'employeedatadelete_state.dart';

class EmployeedatadeleteBloc
    extends Bloc<EmployeedatadeleteEvent, EmployeedatadeleteState> {
  final EmployeeRepository _employeeRepository;
  EmployeedatadeleteBloc(this._employeeRepository)
      : super(EmployeedatadeletingState()) {
    on<DeleteEmployeedataEvent>((event, emit) async {
      // TODO: implement event handler
      emit(EmployeedatadeletingState());
      try {
        await _employeeRepository.deleteEmployeeData(event.id);
        emit(EmployeedatadeletedState());
      } catch (e) {
        emit(EmployeedatadeleteErrorgState(e.toString()));
        print(e.toString());
      }
    });
  }
}
