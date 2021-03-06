import 'package:flutter/material.dart';
import 'package:kwarantapp/providers/measurement_provider.dart';
import 'package:kwarantapp/screens/Measurements/widgets/add_measurement_widget.dart';
import 'package:provider/provider.dart';

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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Theme.of(context).primaryColor, Colors.redAccent],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(20.0),
                children: measurementList
                    .map(
                      (measurement) => MeasurementWidget(
                        measurement: measurement,
                      ),
                    )
                    .toList(),
              ),
            ),
            //AddMeasurementWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          color: Theme.of(context).accentColor,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  elevation: 20.0,
                  content: AddMeasurementWidget(),
                );
              });
        },
      ),
    );
  }
}
