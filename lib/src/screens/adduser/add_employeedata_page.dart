import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_route.dart';

class AddUserDataPage extends StatelessWidget {
  const AddUserDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Empployee Data"),
        ),
        body: Column());
  }
}
