import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final String imageUrl; // URL or asset path for the category image
  final VoidCallback onTap; // Callback when the card is tapped

  const CategoryCard({
    Key? key,
    required this.categoryName,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Handle tap event
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0), // Rounded corners
        ),
        elevation: 4, // Add shadow
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0), // Match the card's rounded corners
          child: Stack(
            children: [
              // Background Image
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150, // Adjust height as needed
              ),
              // Gradient Overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
              // Category Name
              Positioned(
                bottom: 16,
                left: 16,
                child: Text(
                  categoryName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}