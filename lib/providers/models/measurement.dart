class Measurement {
  String id;
  double temperature;
  DateTime date;
  bool cough;
  bool fever;
  bool shortBreath;
  bool musclePain;
  bool fatigue;

  Measurement({
    this.id,
    this.temperature,
    this.date,
    this.cough = false,
    this.fever = false,
    this.shortBreath = false,
    this.musclePain = false,
    this.fatigue = false,
  });
}
