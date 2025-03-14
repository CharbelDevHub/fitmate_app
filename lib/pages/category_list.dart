import 'package:fitmate_app/core/services/exercise_category.dart';
import 'package:flutter/material.dart';
import 'package:fitmate_app/pages/exercise_list.dart';
import 'package:fitmate_app/views/category_item.dart';
import 'package:fitmate_app/data/models/exercise_category.dart'; // Import the ExerciseCategory model

class CategoryListPage extends StatefulWidget {
  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  final ExerciseService _exerciseService = ExerciseService();
  List<ExerciseCategory> _categories = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    try {
      final categories = await _exerciseService.fetchCategories();
      setState(() {
        _categories = categories;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load categories: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Categories'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : ListView.builder(
                  padding: EdgeInsets.all(16.0),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final category = _categories[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: CategoryCard(
                        categoryName: category.name,
                        imageUrl: category.image_url ?? 'https://via.placeholder.com/150', // Use a placeholder if image_url is null
                        onTap: () {
                          // Navigate to the exercises list for this category
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExercisesListPage(
                                categoryId: category.id.toString(),
                                categoryName: category.name,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
    );
  }
}