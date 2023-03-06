import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'employeedataadd_event.dart';
part 'employeedataadd_state.dart';

class EmployeedataaddBloc extends Bloc<EmployeedataaddEvent, EmployeedataaddState> {
  EmployeedataaddBloc() : super(EmployeedataaddInitial()) {
    on<EmployeedataaddEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
