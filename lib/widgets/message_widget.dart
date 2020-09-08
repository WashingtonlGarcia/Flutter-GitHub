import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final IconData iconData;
  final String message;

  const MessageWidget({@required this.iconData, @required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 50,
          color: Colors.grey[800],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          message,
          style: TextStyle(
            color: Colors.grey[800],
          ),
        )
      ],
    );
  }
}
