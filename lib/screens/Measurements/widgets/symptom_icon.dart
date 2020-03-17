import 'package:flutter/material.dart';

class SymptomIcon extends StatelessWidget {
  final bool show;
  final String assetPath;

  const SymptomIcon({Key key, this.show, this.assetPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return show
        ? Container(
            width: 50,
            height: 50,
            child: Image.asset(assetPath),
          )
        : Container(
            width: 50,
            height: 50,
          );
  }
}
