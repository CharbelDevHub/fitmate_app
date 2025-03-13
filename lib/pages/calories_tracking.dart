import 'package:flutter/material.dart';

class CaloriesTrackingPage extends StatefulWidget {
  @override
  _CaloriesTrackingPageState createState() => _CaloriesTrackingPageState();
}

class _CaloriesTrackingPageState extends State<CaloriesTrackingPage> {
  final _formKey = GlobalKey<FormState>();
  String _calories = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Save or process the calories data
      print('Calories: $_calories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter Calories'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter calories';
                }
                return null;
              },
              onSaved: (value) {
                _calories = value!;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}