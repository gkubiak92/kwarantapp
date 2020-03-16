class Measurement {
  String id;
  double temperature;
  DateTime date;
  bool cough;
  bool fever;
  bool shortBreath;

  Measurement({
    this.id,
    this.temperature,
    this.date,
    this.cough = false,
    this.fever = false,
    this.shortBreath = false,
  });
}
