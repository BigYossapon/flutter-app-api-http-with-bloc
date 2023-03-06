import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'employeedataedit_event.dart';
part 'employeedataedit_state.dart';

class EmployeedataeditBloc extends Bloc<EmployeedataeditEvent, EmployeedataeditState> {
  EmployeedataeditBloc() : super(EmployeedataeditInitial()) {
    on<EmployeedataeditEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
