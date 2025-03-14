import 'package:fitmate_app/core/services/exercise_category.dart';
import 'package:flutter/material.dart';
import 'package:fitmate_app/views/exercise_item.dart';
import 'package:fitmate_app/data/models/exercise.dart'; // Import the Exercise model

class ExercisesListPage extends StatefulWidget {
  final String categoryName;
  final String categoryId;

  const ExercisesListPage({
    Key? key,
    required this.categoryName,
    required this.categoryId,
  }) : super(key: key);

  @override
  _ExercisesListPageState createState() => _ExercisesListPageState();
}

class _ExercisesListPageState extends State<ExercisesListPage> {
  final ExerciseService _exerciseService = ExerciseService();
  List<Exercise> _exercises = [];
  bool _isLoading = true;
  String? _errorMessage;

  String? _selectedFilter; // Selected filter value
  final List<String> _filters = ['All', 'Beginner', 'Intermediate', 'Advanced']; // Filter options
  String _searchQuery = ''; // Search query

  @override
  void initState() {
    super.initState();
    _fetchExercises();
  }

  Future<void> _fetchExercises() async {
    try {
      final exercises = await _exerciseService.fetchExercisesByCategory(widget.categoryId);
      setState(() {
        _exercises = exercises;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load exercises: $e';
        _isLoading = false;
      });
    }
  }

  // Filter exercises based on the selected filter and search query
  List<Exercise> _filterExercises(List<Exercise> exercises) {
    return exercises.where((exercise) {
      bool matchesDifficulty = _selectedFilter == null || _selectedFilter == 'All' || exercise.difficulty == _selectedFilter;
      bool matchesSearch = exercise.name.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesDifficulty && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredExercises = _filterExercises(_exercises);

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
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : ListView.builder(
                  padding: EdgeInsets.all(16.0),
                  itemCount: filteredExercises.length,
                  itemBuilder: (context, index) {
                    final exercise = filteredExercises[index];
                    return ExerciseItem(
                      exerciseName: exercise.name,
                      imageUrl: exercise.image_url ?? 'https://via.placeholder.com/150', // Use a placeholder if image_url is null
                    );
                  },
                ),
    );
  }
}