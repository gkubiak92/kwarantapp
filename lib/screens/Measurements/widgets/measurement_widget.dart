import 'package:flutter/material.dart';
import 'package:kwarantapp/providers/models/measurement.dart';

class MeasurementWidget extends StatelessWidget {
  final Measurement measurement;

  const MeasurementWidget({Key key, this.measurement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.00,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: ListTile(
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
              measurement.cough ? Icon(Icons.thumb_down) : Icon(Icons.thumb_up),
              measurement.fever ? Icon(Icons.thumb_down) : Icon(Icons.thumb_up),
              measurement.shortBreath
                  ? Icon(Icons.thumb_down)
                  : Icon(Icons.thumb_up),
            ],
          ),
        ),
      ),
    );
  }
}
