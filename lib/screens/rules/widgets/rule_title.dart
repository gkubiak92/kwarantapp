import 'package:flutter/material.dart';

class RuleTitle extends StatelessWidget {
  final String title;

  const RuleTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 32,
        ),
      ),
    );
  }
}
