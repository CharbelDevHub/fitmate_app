

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
}
