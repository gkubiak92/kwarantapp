import 'package:flutter/material.dart';
import 'package:kwarantapp/providers/measurement_provider.dart';
import 'package:kwarantapp/providers/models/measurement.dart';
import 'package:provider/provider.dart';

class AddMeasurementWidget extends StatefulWidget {
  @override
  _AddMeasurementWidgetState createState() => _AddMeasurementWidgetState();
}

class _AddMeasurementWidgetState extends State<AddMeasurementWidget> {
  final _formKey = GlobalKey<FormState>();
  var _measurement = Measurement();

  void submitForm() {
    bool isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }

    _formKey.currentState.save();
    Provider.of<MeasurementProvider>(context, listen: false)
        .addMeasurement(_measurement);
    _measurement = Measurement();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(hintText: 'Temperatura'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Wprowadź temperaturę';
                }
              },
              onSaved: (value) => setState(
                  () => _measurement.temperature = double.parse(value)),
            ),
            CheckboxListTile(
              title: Text('Kaszel'),
              value: _measurement.cough,
              onChanged: (value) {
                setState(() {
                  _measurement.cough = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Gorączka'),
              value: _measurement.fever,
              onChanged: (value) {
                setState(() {
                  _measurement.fever = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Duszności'),
              value: _measurement.shortBreath,
              onChanged: (value) {
                setState(() {
                  _measurement.shortBreath = value;
                });
              },
            ),
            RaisedButton(
              child: Text('Dodaj'),
              onPressed: submitForm,
            ),
          ],
        ),
      ),
    );
  }
}