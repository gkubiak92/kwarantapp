import 'package:flutter/material.dart';
import 'package:kwarantapp/providers/measurement_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/add_measurement_widget.dart';
import 'widgets/measurement_widget.dart';

class MeasurementsScreen extends StatelessWidget {
  static const routeName = '/measurements';
  @override
  Widget build(BuildContext context) {
    var measurementList =
        Provider.of<MeasurementProvider>(context).measurementList;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista pomiarów'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AddMeasurementWidget(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: measurementList
                  .map(
                    (measurement) => MeasurementWidget(
                      measurement: measurement,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
