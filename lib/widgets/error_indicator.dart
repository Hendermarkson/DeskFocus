import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  final String text;

  ErrorIndicator({this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.error),
        Text(this.text),
      ],
    );
  }
}
