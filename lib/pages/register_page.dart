import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_training/components/MyButton.dart';
import 'package:firebase_app_training/components/my_textfield.dart';
import 'package:firebase_app_training/helper/helper_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class RegisterPage extends StatefulWidget {
  final Function() onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordConfirmController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  void RegisterUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    if (passwordController.text != passwordConfirmController.text) {
      Navigator.pop(context);
      displayMessageToUser("Password don't match", context);
    } else {
      try {
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        createUserDocument(userCredential);
        if (context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        displayMessageToUser(e.code, context);
      }
    }
  }

  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': usernameController.text
      }).onError((error, stackTrace) => print('$error, $stackTrace'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 80,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                Gap(15),
                const Text(
                  'M I N I M A L',
                  style: TextStyle(fontSize: 20),
                ),
                Gap(25),
                MyTextField(
                    hintText: 'username',
                    obsecureText: false,
                    controller: usernameController),
                Gap(10),
                MyTextField(
                    hintText: 'email',
                    obsecureText: false,
                    controller: emailController),
                Gap(10),
                MyTextField(
                    hintText: 'password',
                    obsecureText: false,
                    controller: passwordController),
                Gap(10),
                MyTextField(
                    hintText: 'password again',
                    obsecureText: true,
                    controller: passwordConfirmController),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot password?'),
                    ],
                  ),
                ),
                Gap(10),
                MyButton(
                  text: 'Login',
                  onTap: () => RegisterUser(),
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    GestureDetector(
                      onTap: () => widget.onTap(),
                      child: Text(
                        " Login Here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
