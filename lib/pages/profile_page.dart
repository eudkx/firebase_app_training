import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_training/components/my_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilepPage extends StatelessWidget {
  ProfilepPage({super.key});
  User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              alignment: Alignment(0, 0.3),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary),
              child: Text(
                'Profile',
                style: TextStyle(color: Colors.white, fontSize: 21),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: getUserDetails(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  Map<String, dynamic>? user = snapshot.data!.data();
                  return Column(
                    children: [
                      Text(
                        user!['email'],
                      ),
                      Text(user['username']),
                    ],
                  );
                } else {
                  return Text('No data');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
