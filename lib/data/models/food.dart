
class Food {
  final int food_id;
  final String name;
  final double calories;
  final int grams;
  final int protein;
  final int carbs;
  final int fats;
  final String? image_url;
  final String? source_url;
  final bool is_deleted;

  Food({
    required this.food_id,
    required this.name,
    required this.calories,
    required this.grams,
    required this.protein,
    required this.carbs,
    required this.fats,
    this.image_url,
    this.source_url,
    this.is_deleted = false,
  });
}