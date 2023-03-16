import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_test01/src/data/repository/employee_repository.dart';

part 'employeedataedit_event.dart';
part 'employeedataedit_state.dart';

class EmployeedataeditBloc
    extends Bloc<EmployeedataeditEvent, EmployeedataeditState> {
  EmployeeRepository _employeeRepository;
  EmployeedataeditBloc(this._employeeRepository)
      : super(EmployeedataeditingState()) {
    on<EditEmployeedataEvent>((event, emit) async {
      // TODO: implement event handler
      emit(EmployeedataeditingState());
      try {
        await _employeeRepository.putEmployeeData(
            event.id!,
            event.name!,
            event.mail!,
            event.phone!,
            event.address!,
            event.position!,
            event.file!);
        emit(EmployeedataeditedState('edit success'));
      } catch (e) {
        emit(EmployeedataeditErrorState(e.toString()));
        print(e.toString());
      }
    });
  }
}
