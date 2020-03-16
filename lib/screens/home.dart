import 'package:flutter/material.dart';
import 'package:kwarantapp/screens/sidedrawer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KwarantApp'),
      ),
      drawer: SideDrawer(),
      body: Center(
        child: Text('KwarantApp'),
      ),
    );
  }
}
