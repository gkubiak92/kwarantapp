import 'package:flutter/material.dart';
import 'package:kwarantapp/screens/sidedrawer.dart';

class HomeScreen extends StatelessWidget {
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
