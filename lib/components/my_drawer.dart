import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: Icon(Icons.favorite_outline),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        title: Text("H O M E"),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/home_page');
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        title: Text("P R O F I L E"),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/profile_page');
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.group,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        title: Text("U S E R S"),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/users_page');
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    title: Text("L O G O U T"),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();

                      setState(() {});
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/login_register_page');
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
