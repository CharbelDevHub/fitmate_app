import 'dart:convert';
import 'package:fitmate_app/core/constants/constants.dart';
import 'package:fitmate_app/data/models/exercise.dart';
import 'package:fitmate_app/data/models/exercise_category.dart';
import 'package:http/http.dart' as http;

class ExerciseService {
  final String baseUrl = "$API_BASE_URL/Exercise"; // Replace with your API URL

  /// Fetch all categories
Future<List<ExerciseCategory>> fetchCategories() async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/GetAllCategories'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((category) => ExerciseCategory.fromJson(category)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  } catch (e) {
    throw Exception('Error fetching categories: $e');
  }
}

  /// Fetch exercises by category ID
Future<List<Exercise>> fetchExercisesByCategory(String categoryId) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/exercises?category=$categoryId'));

    if (response.statusCode == 200) {
      // Decode the JSON response
      List<dynamic> jsonResponse = json.decode(response.body);

      // Map the JSON response to a list of Exercise objects
      return jsonResponse.map((exercise) => Exercise.fromJson(exercise)).toList();
    } else if (response.statusCode == 404) {
      throw Exception('Exercises not found for category ID: $categoryId');
    } else if (response.statusCode == 500) {
      throw Exception('Server error');
    } else {
      throw Exception('Failed to load exercises: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching exercises: $e');
  }
}
}
