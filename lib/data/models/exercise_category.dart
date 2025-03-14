class ExerciseCategory {
  final int id;
  final String name;
  final String? description;
  final String? image_url;

  ExerciseCategory({
    required this.id,
    required this.name,
    this.description,
    this.image_url,
  });

   // Factory constructor to parse JSON
  factory ExerciseCategory.fromJson(Map<String, dynamic> json) {
    return ExerciseCategory(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image_url: json['image_url'],
    );
  }
}
