import 'package:flutter/material.dart';

import 'widgets/homeheader.dart';
import 'widgets/homemenu.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Theme.of(context).primaryColor, Colors.redAccent],
          ),
        ),
        child: Column(
          children: <Widget>[
            HomeHeader(),
            HomeMenu(),
          ],
        ),
      ),
    );
  }
}
