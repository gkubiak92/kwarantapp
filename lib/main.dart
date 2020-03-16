import 'package:flutter/material.dart';
import 'package:kwarantapp/providers/measurement_provider.dart';
import 'package:kwarantapp/screens/home.dart';
import 'package:kwarantapp/screens/rules.dart';
import 'package:provider/provider.dart';

import 'screens/Measurements/measurements_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MeasurementProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          Rules.routeName: (context) => Rules(),
          MeasurementsScreen.routeName: (context) => MeasurementsScreen(),
        },
      ),
    );
  }
}
