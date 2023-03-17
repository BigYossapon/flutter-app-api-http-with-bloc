import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_test01/src/data/repository/employee_repository.dart';

import '../../../../data/model/employee_model.dart';

part 'employeedataadd_event.dart';
part 'employeedataadd_state.dart';

class EmployeedataaddBloc
    extends Bloc<EmployeedataaddEvent, EmployeedataaddState> {
  final EmployeeRepository _employeeRepository;

  EmployeedataaddBloc(this._employeeRepository)
      : super(EmployeedataaddingState()) {
    on<AddEmployeedataEvent>((event, emit) async {
      // TODO: implement event handler
      emit(EmployeedataaddingState());
      try {
        //final employee =
        // await _employeeRepository.postEmployeeData(event.employeeModel);
        await _employeeRepository.postEmployeeData(event.name, event.mail,
            event.address, event.phone, event.position, event.file);
        emit(EmployeedataaddedState('add data success'));
      } catch (e) {
        emit(EmployeedataErrorState(e.toString()));
        print(e.toString());
      }
    });
  }
}
