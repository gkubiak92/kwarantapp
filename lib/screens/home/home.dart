import 'package:flutter/material.dart';

import 'widgets/homeheader.dart';
import 'widgets/homemenu.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HomeHeader(),
          HomeMenu(),
        ],
      ),
    );
  }
}
