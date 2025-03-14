import 'package:fitmate_app/data/providers/auth_provider.dart';
import 'package:fitmate_app/pages/login_register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitmate_app/pages/home_page.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProviders>(context);

    // Check if the user is logged in
    if (authProvider.currentUser != null) {
      return HomePage();
    } else {
      return const LoginPage();
    }
  }
}