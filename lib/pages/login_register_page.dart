import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitmate_app/data/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    final authProvider = Provider.of<AuthProviders>(context, listen: false);

    try {
      await authProvider.signInWithEmailAndPassword(
        email: _controllerEmail.text.trim(),
        password: _controllerPassword.text.trim(),
      );
      setState(() {
        errorMessage = ''; // Clear error message on success
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message; // Set error message
      });
    }
  }

  Future<void> createUserWithEmailAndPassword(BuildContext context) async {
    final authProvider = Provider.of<AuthProviders>(context, listen: false);

    try {
      await authProvider.createUserWithEmailAndPassword(
        email: _controllerEmail.text.trim(),
        password: _controllerPassword.text.trim(),
      );
      setState(() {
        errorMessage = ''; // Clear error message on success
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message; // Set error message
      });
    }
  }

  Widget _title() {
    return const Text("FitMate Login");
  }

  Widget _entryField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: title),
    );
  }

  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : 'Error: $errorMessage',
      style: const TextStyle(color: Colors.red),
    );
  }

  Widget _submitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (isLogin) {
          await signInWithEmailAndPassword(context);
        } else {
          await createUserWithEmailAndPassword(context);
        }
      },
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
          errorMessage = ''; // Clear error message when switching modes
        });
      },
      child: Text(isLogin ? 'Register instead' : 'Login instead'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _entryField('Email', _controllerEmail),
            _entryField('Password', _controllerPassword),
            const SizedBox(height: 20),
            _errorMessage(),
            _submitButton(context),
            const SizedBox(height: 10),
            _loginOrRegisterButton(),
          ],
        ),
      ),
    );
  }
}