import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExerciseItem extends StatefulWidget {
  final String exerciseName;
  final String imageUrl;

  const ExerciseItem({
    Key? key,
    required this.exerciseName,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _ExerciseItemState createState() => _ExerciseItemState();
}

class _ExerciseItemState extends State<ExerciseItem> {
  bool _isFavorite = false; // Track if the exercise is favorited

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus(); // Load favorite status when the widget is created
  }

  // Load favorite status from local storage
  Future<void> _loadFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isFavorite = prefs.getBool(widget.exerciseName) ?? false;
    });
  }

  // Toggle favorite status and save to local storage
  Future<void> _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isFavorite = !_isFavorite;
      prefs.setBool(widget.exerciseName, _isFavorite);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          // Circle Image
          CircleAvatar(
            backgroundImage: NetworkImage(widget.imageUrl),
            radius: 30,
          ),
          SizedBox(width: 16), // Spacing between image and text
          // Exercise Name
          Expanded(
            child: Text(
              widget.exerciseName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Heart Button
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
    );
  }
}