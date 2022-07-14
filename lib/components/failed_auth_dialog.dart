import 'package:flutter/material.dart';

class FailedAuthDialog extends StatelessWidget {
  const FailedAuthDialog(
      {Key? key, required this.title, required this.content})
      : super(key: key);

  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'OK');
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
