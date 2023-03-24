part of 'employeedataedit_bloc.dart';

abstract class EmployeedataeditEvent extends Equatable {
  const EmployeedataeditEvent();

  @override
  List<Object> get props => [];
}

class EditEmployeedataEvent extends EmployeedataeditEvent {
  int? id;
  String? name;
  String? mail;
  String? phone;
  String? address;
  String? position;
  File? file;

  EditEmployeedataEvent(this.id, this.name, this.mail, this.phone, this.address,
      this.position, this.file);
  @override
  List<Object> get props => [id!, name!, mail!, phone!, address!, position!];
}
