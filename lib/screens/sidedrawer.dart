import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('KwarantApp'),
            decoration: BoxDecoration(
              color: Colors.indigoAccent,
            ),
          ),
          ListTile(
            title: Text('Aktualności'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Pomiary'),
            onTap: () {},
          ),
          ListTile(
            title: Text('O apliakcji'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
