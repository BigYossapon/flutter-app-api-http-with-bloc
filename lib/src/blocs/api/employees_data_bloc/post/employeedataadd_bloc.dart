import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/model/employee_model.dart';

part 'employeedataadd_event.dart';
part 'employeedataadd_state.dart';

class EmployeedataaddBloc
    extends Bloc<EmployeedataaddEvent, EmployeedataaddState> {
  EmployeedataaddBloc() : super(EmployeedataaddingState()) {
    on<EmployeedataaddEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
