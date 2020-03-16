import 'package:flutter/material.dart';
import 'package:kwarantapp/providers/measurement_provider.dart';
import 'package:kwarantapp/screens/home/home.dart';
import 'package:kwarantapp/screens/rules/rules.dart';
import 'package:kwarantapp/theme/style.dart';
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
        theme: appTheme(),
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
