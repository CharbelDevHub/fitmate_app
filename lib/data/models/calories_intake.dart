class CaloriesIntake {
  final int calories_intake_id;
  final int profile_id;
  final DateTime date;
  final int? total_calories;

  CaloriesIntake({
    required this.calories_intake_id,
    required this.profile_id,
    required this.date,
    this.total_calories,
  });
}
