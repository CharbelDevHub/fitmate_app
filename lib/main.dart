import 'package:firebase_core/firebase_core.dart';
import 'package:fitmate_app/data/providers/auth_provider.dart';
import 'package:fitmate_app/firebase_options.dart';
import 'package:fitmate_app/pages/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProviders(), // Provide the AuthProvider
      child: MaterialApp(
        title: 'FitMate App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WidgetTree(),
      ),
    );
  }
}
