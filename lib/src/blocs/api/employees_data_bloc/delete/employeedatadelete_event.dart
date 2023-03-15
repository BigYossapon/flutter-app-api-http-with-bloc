part of 'employeedatadelete_bloc.dart';

abstract class EmployeedatadeleteEvent extends Equatable {
  const EmployeedatadeleteEvent();
}

class DeleteEmployeedataEvent extends EmployeedatadeleteEvent {
  int id;
  DeleteEmployeedataEvent(this.id);
  @override
  List<Object> get props => [];
}
