import 'package:firebase_app_training/auth/login_or_register.dart';
import 'package:firebase_app_training/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          print(snapshot.hasData);
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
