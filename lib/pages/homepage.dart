import 'package:firebase_app_training/components/my_drawer.dart';
import 'package:firebase_app_training/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController newPostController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              scaffoldKey.currentState?.openDrawer();
                            },
                            child: Icon(Icons.circle_outlined),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "W A L L",
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(24),
                child: MyTextField(
                    hintText: 'Say Something',
                    obsecureText: false,
                    controller: newPostController),
              ),
            ),
            Expanded(flex: 5, child: Container())
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
