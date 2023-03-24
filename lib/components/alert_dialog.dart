import 'package:flutter/material.dart';

class AlertDialogdelete extends StatelessWidget {
  const AlertDialogdelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning'),
      content: Text('Are you sure you want to delete this data?'),
      actions: <Widget>[
        TextButton(
          child: Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        TextButton(
          child: Text('No'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
