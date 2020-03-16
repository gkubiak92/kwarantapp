import 'package:flutter/material.dart';
import 'package:kwarantapp/screens/rules.dart';

import 'Measurements/measurements_screen.dart';

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
            leading: Icon(Icons.report),
            title: Text('Zasady kwarantanny'),
            onTap: () => Navigator.of(context).pushNamed(Rules.routeName),
          ),
          ListTile(
            leading: Icon(Icons.web),
            title: Text('Aktualności'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.filter_list),
            title: Text('Pomiary'),
            onTap: () =>
                Navigator.of(context).pushNamed(MeasurementsScreen.routeName),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('O apliakcji'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
