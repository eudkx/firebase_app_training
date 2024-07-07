import 'package:firebase_app_training/auth/auth.dart';
import 'package:firebase_app_training/auth/login_or_register.dart';
import 'package:firebase_app_training/firebase_options.dart';
import 'package:firebase_app_training/pages/homepage.dart';
import 'package:firebase_app_training/pages/login_dart.dart';
import 'package:firebase_app_training/pages/profile_page.dart';
import 'package:firebase_app_training/pages/register_page.dart';
import 'package:firebase_app_training/pages/users_page.dart';
import 'package:firebase_app_training/themes/dart_mode.dart';
import 'package:firebase_app_training/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/login_register_page': (context) => const AuthPage(),
        '/home_page': (context) => HomePage(),
        '/profile_page': (context) => ProfilepPage(),
        '/users_page': (context) => const UsersPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
