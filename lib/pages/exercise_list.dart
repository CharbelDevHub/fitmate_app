import 'package:flutter/material.dart';
import 'package:fitmate_app/views/exercise_item.dart';

class ExercisesListPage extends StatefulWidget {
  final String categoryName;

  const ExercisesListPage({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  @override
  _ExercisesListPageState createState() => _ExercisesListPageState();
}

class _ExercisesListPageState extends State<ExercisesListPage> {
  String? _selectedFilter; // Selected filter value
  final List<String> _filters = ['All', 'Beginner', 'Intermediate', 'Advanced']; // Filter options
  String _searchQuery = ''; // Search query

  // Example list of exercises for the selected category
  List<Map<String, String>> getExercisesForCategory(String category) {
    switch (category) {
      case 'Cardio':
        return [
          {
            'name': 'Running',
            'imageUrl': 'https://www.realsimple.com/thmb/-PW_i-RMLQ4cj3-okjqccGGUock=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/health-benefits-of-pushups-GettyImages-498315681-7008d40842444270868c88b516496884.jpg',
            'difficulty': 'Beginner',
          },
          {
            'name': 'Cycling',
            'imageUrl': 'https://www.realsimple.com/thmb/-PW_i-RMLQ4cj3-okjqccGGUock=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/health-benefits-of-pushups-GettyImages-498315681-7008d40842444270868c88b516496884.jpg',
            'difficulty': 'Intermediate',
          },
        ];
      case 'Strength':
        return [
          {
            'name': 'Push-ups',
            'imageUrl': 'https://www.realsimple.com/thmb/-PW_i-RMLQ4cj3-okjqccGGUock=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/health-benefits-of-pushups-GettyImages-498315681-7008d40842444270868c88b516496884.jpg',
            'difficulty': 'Beginner',
          },
          {
            'name': 'Squats',
            'imageUrl': 'https://www.realsimple.com/thmb/-PW_i-RMLQ4cj3-okjqccGGUock=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/health-benefits-of-pushups-GettyImages-498315681-7008d40842444270868c88b516496884.jpg',
            'difficulty': 'Advanced',
          },
        ];
      case 'Yoga':
        return [
          {
            'name': 'Downward Dog',
            'imageUrl': 'https://www.realsimple.com/thmb/-PW_i-RMLQ4cj3-okjqccGGUock=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/health-benefits-of-pushups-GettyImages-498315681-7008d40842444270868c88b516496884.jpg',
            'difficulty': 'Beginner',
          },
          {
            'name': 'Warrior Pose',
            'imageUrl': 'https://www.realsimple.com/thmb/-PW_i-RMLQ4cj3-okjqccGGUock=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/health-benefits-of-pushups-GettyImages-498315681-7008d40842444270868c88b516496884.jpg',
            'difficulty': 'Intermediate',
          },
        ];
      case 'HIIT':
        return [
          {
            'name': 'Burpees',
            'imageUrl': 'https://www.realsimple.com/thmb/-PW_i-RMLQ4cj3-okjqccGGUock=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/health-benefits-of-pushups-GettyImages-498315681-7008d40842444270868c88b516496884.jpg',
            'difficulty': 'Advanced',
          },
          {
            'name': 'Jump Squats',
            'imageUrl': 'https://www.realsimple.com/thmb/-PW_i-RMLQ4cj3-okjqccGGUock=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/health-benefits-of-pushups-GettyImages-498315681-7008d40842444270868c88b516496884.jpg',
            'difficulty': 'Intermediate',
          },
        ];
      default:
        return [];
    }
  }

  // Filter exercises based on the selected filter and search query
  List<Map<String, String>> _filterExercises(List<Map<String, String>> exercises) {
    return exercises.where((exercise) {
      bool matchesDifficulty = _selectedFilter == null || _selectedFilter == 'All' || exercise['difficulty'] == _selectedFilter;
      bool matchesSearch = exercise['name']!.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesDifficulty && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final exercises = getExercisesForCategory(widget.categoryName);
    final filteredExercises = _filterExercises(exercises);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search exercises...', // Placeholder text
            border: InputBorder.none, // Remove underline
            icon: Icon(Icons.search), // Search icon
          ),
          onChanged: (value) {
            setState(() {
              _searchQuery = value; // Update the search query
            });
          },
        ),
        actions: [
          // Filter dropdown
          DropdownButton<String>(
            value: _selectedFilter,
            hint: Text('Filter'), // Placeholder text
            icon: Icon(Icons.filter_list), // Filter icon
            onChanged: (String? newValue) {
              setState(() {
                _selectedFilter = newValue; // Update the selected filter
              });
            },
            items: _filters.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: filteredExercises.length,
        itemBuilder: (context, index) {
          return ExerciseItem(
            exerciseName: filteredExercises[index]['name']!,
            imageUrl: filteredExercises[index]['imageUrl']!,
          );
        },
      ),
    );
  }
}