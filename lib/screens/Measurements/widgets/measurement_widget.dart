import 'package:flutter/material.dart';
import 'package:kwarantapp/providers/measurement_provider.dart';
import 'package:kwarantapp/providers/models/measurement.dart';
import 'package:intl/intl.dart';
import 'package:kwarantapp/screens/measurements/widgets/symptom_icon.dart';
import 'package:provider/provider.dart';

class MeasurementWidget extends StatelessWidget {
  final Measurement measurement;

  const MeasurementWidget({Key key, this.measurement}) : super(key: key);

  bool checkSymptoms() {
    if (measurement.cough ||
        measurement.fever ||
        measurement.shortBreath ||
        measurement.musclePain ||
        measurement.fatigue) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('dd-MM-yyyy HH:mm');
    final String measurementDate = dateFormat.format(measurement.date);
    final bool hasSymptoms = checkSymptoms();
    final measurementProvider =
        Provider.of<MeasurementProvider>(context, listen: false);

    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                child: Icon(
                  Icons.delete,
                  color: Theme.of(context).primaryColor,
                ),
                onTap: () => showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Usunięcie pomiaru'),
                      content: Text('Jesteś pewien?'),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            measurementProvider
                                .removeMeasurement(measurement.id);
                            Navigator.of(context).pop();
                          },
                          child: Text('Tak'),
                        ),
                        FlatButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('Nie'),
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                      elevation: 24.0,
                    );
                  },
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  measurement.temperature.toString(),
                  style: TextStyle(
                    fontSize: 32,
                    color: measurement.temperature < 38.0
                        ? Colors.greenAccent
                        : Colors.redAccent,
                  ),
                ),
                Expanded(
                  child: Text(
                    measurementDate,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          hasSymptoms
              ? Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Brak objaw',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SymptomIcon(
                      show: measurement.cough,
                      assetPath: 'assets/cough.png',
                    ),
                    SymptomIcon(
                      show: measurement.fever,
                      assetPath: 'assets/fever.png',
                    ),
                    SymptomIcon(
                      show: measurement.shortBreath,
                      assetPath: 'assets/breath.png',
                    ),
                    SymptomIcon(
                      show: measurement.musclePain,
                      assetPath: 'assets/musclepain.png',
                    ),
                    SymptomIcon(
                      show: measurement.fatigue,
                      assetPath: 'assets/fatigue.png',
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
