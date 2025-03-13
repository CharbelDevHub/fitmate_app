import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitmate_app/auth.dart';
import 'package:fitmate_app/pages/calories_tracking.dart';
import 'package:fitmate_app/pages/category_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;
  int _selectedIndex = 0; // Index for the selected tab

  // Pages to display based on the selected tab
  final List<Widget> _pages = [
    CategoryListPage(),
    CaloriesTrackingPage(), // Replace with your Calories Tracking Page
  ];

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return Text('FitMate App');
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User Email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  // Bottom Navigation Bar
  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Exercises',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_fire_department),
          label: 'Calories',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: _bottomNavigationBar(), // Add the bottom navigation bar
      floatingActionButton: _signOutButton(), // Sign-out button
    );
  }
}

