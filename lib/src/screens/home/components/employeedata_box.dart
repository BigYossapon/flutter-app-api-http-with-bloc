import 'package:flutter/material.dart';

class EmployeedataBox extends StatelessWidget {
  int index;
  int ID;
  String Name;
  String Phone;
  String Address;
  String Position;
  String Mail;
  NetworkImage Image_employee;

  EmployeedataBox(this.index, this.ID, this.Name, this.Phone, this.Address,
      this.Position, this.Mail, this.Image_employee);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
