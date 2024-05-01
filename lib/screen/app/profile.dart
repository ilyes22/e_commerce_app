import 'package:e_commerce_app/SignUp/login.dart';
import 'package:e_commerce_app/tools/listtile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: Colors.amber,
        title: const Text('Personal Profile'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        ],
      ),
      body: ListView(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 60,
                child: Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.amber,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Center(child: Text('User Name')),
          ),
          //list tile

          kList(
            icons: Icons.settings,
            title: 'Account Setting',
            tap: () {},
          ),
          kList(
            icons: Icons.security,
            title: 'Security Personnal',
            tap: () {},
          ),

          kList(
              icons: Icons.edit_notifications_sharp,
              title: 'Edit profile',
              tap: () {}),
          kList(
              icons: Icons.exit_to_app,
              title: 'Sing Out ',
              tap: () {
                FirebaseAuth.instance.signOut();
                // GoogleSignIn().signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (c) => const LogIn(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
