part of 'employeedataadd_bloc.dart';

abstract class EmployeedataaddEvent extends Equatable {
  const EmployeedataaddEvent();
}

class AddEmployeedataEvent extends EmployeedataaddEvent {
  //EmployeeModel employeeModel;
  File file;
  String name;
  String mail;
  String phone;
  String address;
  String position;

  AddEmployeedataEvent(
      this.name, this.mail, this.phone, this.address, this.position, this.file);

  @override
  List<Object> get props => [];
}
