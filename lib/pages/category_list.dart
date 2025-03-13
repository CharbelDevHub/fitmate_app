import 'package:fitmate_app/pages/exercise_list.dart';
import 'package:fitmate_app/views/category_item.dart';
import 'package:flutter/material.dart';

class CategoryListPage extends StatelessWidget {
  // Example list of categories with image URLs
  final List<Map<String, String>> categories = [
    {
      'name': 'Cardio',
      'imageUrl': 'https://bellsofsteel.com/cdn/shop/articles/Does-Lat-Pulldown-Work-Forearms.webp?v=1708539827&width=1024', // Replace with actual image URL
    },
    {
      'name': 'Strength',
      'imageUrl': 'https://bellsofsteel.com/cdn/shop/articles/Does-Lat-Pulldown-Work-Forearms.webp?v=1708539827&width=1024',
    },
    {
      'name': 'Yoga',
      'imageUrl': 'https://bellsofsteel.com/cdn/shop/articles/Does-Lat-Pulldown-Work-Forearms.webp?v=1708539827&width=1024',
    },
    {
      'name': 'HIIT',
      'imageUrl': 'https://bellsofsteel.com/cdn/shop/articles/Does-Lat-Pulldown-Work-Forearms.webp?v=1708539827&width=1024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Categories'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: CategoryCard(
              categoryName: categories[index]['name']!,
              imageUrl: categories[index]['imageUrl']!,
              onTap: () {
                // Navigate to the exercises list for this category
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExercisesListPage(
                      categoryName: categories[index]['name']!,
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