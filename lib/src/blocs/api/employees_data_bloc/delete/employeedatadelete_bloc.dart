import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'employeedatadelete_event.dart';
part 'employeedatadelete_state.dart';

class EmployeedatadeleteBloc
    extends Bloc<EmployeedatadeleteEvent, EmployeedatadeleteState> {
  EmployeedatadeleteBloc() : super(EmployeedatadeleteInitial()) {
    on<EmployeedatadeleteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
