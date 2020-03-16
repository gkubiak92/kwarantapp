import 'package:flutter/material.dart';
import 'package:kwarantapp/providers/models/measurement.dart';
import 'package:intl/intl.dart';

class MeasurementWidget extends StatelessWidget {
  final Measurement measurement;

  const MeasurementWidget({Key key, this.measurement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('dd.MM.yyyy HH:mm');
    final measurementDate = dateFormat.format(measurement.date);

    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Text(measurementDate),
              ],
            ),
          ),
          ListTile(
            leading: measurement.temperature <= 36.6
                ? Icon(
                    Icons.thumb_up,
                    color: Colors.greenAccent,
                  )
                : Icon(Icons.thumb_down, color: Colors.redAccent),
            title: Text(measurement.temperature.toString()),
            trailing: Container(
              width: 200,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  measurement.cough
                      ? Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/cough.png'),
                        )
                      : Container(
                          width: 50,
                          height: 50,
                        ),
                  measurement.fever
                      ? Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/fever.png'),
                        )
                      : Container(
                          width: 50,
                          height: 50,
                        ),
                  measurement.shortBreath
                      ? Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/breath.png'),
                        )
                      : Container(
                          width: 50,
                          height: 50,
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
