import 'package:flutter/foundation.dart';

import 'models/measurement.dart';

class MeasurementProvider with ChangeNotifier {
  List<Measurement> _measurementList = [
    Measurement(
      id: 'blablalba',
      date: DateTime.now(),
      temperature: 36.6,
      cough: true,
    ),
    Measurement(
      id: 'blablalba',
      date: DateTime.now(),
      temperature: 38.6,
      cough: true,
      fever: true,
    ),
    Measurement(
      id: 'blablalba',
      date: DateTime.now(),
      temperature: 36.8,
    ),
  ];

  List<Measurement> get measurementList {
    _measurementList.sort((a, b) => b.date.compareTo(a.date));
    return _measurementList;
  }

  void addMeasurement(Measurement measurement) {
    _measurementList.add(measurement);
    notifyListeners();
  }
}
