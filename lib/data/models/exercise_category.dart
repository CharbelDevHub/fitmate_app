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

   // Factory constructor to parse JSON
  factory ExerciseCategory.fromJson(Map<String, dynamic> json) {
    return ExerciseCategory(
      exercise_category_id: json['exercise_category_id'],
      name: json['name'],
      description: json['description'],
      image_url: json['image_url'],
    );
  }
}
