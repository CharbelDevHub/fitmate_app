class Exercise {
  final int exercise_id;
  final String name;
  final String focus_area;
  final String equipment;
  final String? description;
  final String? image_url;
  final String? video_url;
  final int exercise_category_id;
  final bool is_deleted;

  Exercise({
    required this.exercise_id,
    required this.name,
    required this.focus_area,
    required this.equipment,
    this.description,
    this.image_url,
    this.video_url,
    required this.exercise_category_id,
    this.is_deleted = false,
  });

  // Factory constructor to parse JSON
  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      exercise_id: json['exercise_id'],
      name: json['name'],
      focus_area: json['focus_area'],
      equipment: json['equipment'],
      description: json['description'],
      image_url: json['image_url'],
      video_url: json['video_url'],
      exercise_category_id: json['exercise_category_id'],
      is_deleted: json['is_deleted'] ?? false, // Default to false if not provided
    );
  }
}