class ExerciseCategory {
  final int exercise_category_id;
  final String name;
  final String? description;
  final String? image_url;

  ExerciseCategory({
    required this.exercise_category_id,
    required this.name,
    this.description,
    this.image_url,
  });
}
