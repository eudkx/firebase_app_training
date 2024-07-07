import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_training/components/my_drawer.dart';
import 'package:firebase_app_training/helper/helper_function.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Theme.of(context).colorScheme.inversePrimary,
              padding: const EdgeInsets.all(25.0),
              alignment: Alignment(-1, 0),
              child: Text(
                'All Users',
                style: TextStyle(color: Colors.white, fontSize: 21),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('Users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  displayMessageToUser(snapshot.error.toString(), context);
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                final users = snapshot.data!.docs;
                
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    var user = users[index];
                    return ListTile(
                      title: Text(user!['username']),
                      subtitle: Text(user!['email']),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
