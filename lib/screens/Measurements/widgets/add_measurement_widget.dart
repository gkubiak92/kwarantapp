import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwarantapp/providers/measurement_provider.dart';
import 'package:kwarantapp/providers/models/measurement.dart';
import 'package:provider/provider.dart';

class AddMeasurementWidget extends StatefulWidget {
  @override
  _AddMeasurementWidgetState createState() => _AddMeasurementWidgetState();
}

class _AddMeasurementWidgetState extends State<AddMeasurementWidget> {
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  var _measurement = Measurement();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2019, 8),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDate),
    );
    if (picked != null && picked != TimeOfDay.fromDateTime(_selectedDate)) {
      var newDateTime = DateTime(_selectedDate.year, _selectedDate.month,
          _selectedDate.day, picked.hour, picked.minute, 0, 0, 0);
      setState(() {
        _selectedDate = newDateTime;
      });
    }
  }

  void submitForm() {
    bool isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }

    _measurement.date = _selectedDate;
    _formKey.currentState.save();
    Provider.of<MeasurementProvider>(context, listen: false)
        .addMeasurement(_measurement);
    _measurement = Measurement();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('dd.MM');
    final measurementDate = dateFormat.format(_selectedDate);
    var timeFormat = DateFormat('HH:mm');
    final measurementTime = timeFormat.format(_selectedDate);

    return SingleChildScrollView(
      child: Container(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(measurementDate),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    color: Theme.of(context).primaryColor,
                    onPressed: () => _selectDate(context),
                  ),
                  Text(measurementTime),
                  IconButton(
                    icon: Icon(Icons.timelapse),
                    color: Theme.of(context).primaryColor,
                    onPressed: () => _selectTime(context),
                  ),
                ],
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: 'Podaj temperaturę'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (double.parse(value) >= 38.0) {
                    print('dupa');
                    setState(() {
                      _measurement.fever = true;
                    });
                  } else {
                    setState(() {
                      _measurement.fever = false;
                    });
                  }
                },
                validator: (value) {
                  double temp = double.parse(value);
                  if (value.isEmpty) {
                    return 'Wprowadź temperaturę';
                  } else if (temp < 20) {
                    return 'Wprowadź poprawną temperaturę';
                  } else if (temp > 45) {
                    return 'Wprowadź poprawną temperaturę';
                  }
                },
                onSaved: (value) => setState(
                    () => _measurement.temperature = double.parse(value)),
              ),
              CheckboxListTile(
                title: Text('Kaszel'),
                activeColor: Theme.of(context).primaryColor,
                value: _measurement.cough,
                onChanged: (value) {
                  setState(() {
                    _measurement.cough = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Gorączka'),
                activeColor: Theme.of(context).primaryColor,
                value: _measurement.fever,
                onChanged: (value) {
                  setState(() {
                    _measurement.fever = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Duszności'),
                activeColor: Theme.of(context).primaryColor,
                value: _measurement.shortBreath,
                onChanged: (value) {
                  setState(() {
                    _measurement.shortBreath = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Bóle mięśni'),
                activeColor: Theme.of(context).primaryColor,
                value: _measurement.musclePain,
                onChanged: (value) {
                  setState(() {
                    _measurement.musclePain = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Zmęczenie'),
                activeColor: Theme.of(context).primaryColor,
                value: _measurement.fatigue,
                onChanged: (value) {
                  setState(() {
                    _measurement.fatigue = value;
                  });
                },
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Dodaj',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                onPressed: submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
