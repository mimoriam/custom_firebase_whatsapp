import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';
import 'home/home_screen.dart';
import 'login/login_screen.dart';

class AuthCheckScreenPartTwo extends StatefulWidget {
  const AuthCheckScreenPartTwo({Key? key}) : super(key: key);

  @override
  State<AuthCheckScreenPartTwo> createState() => _AuthCheckScreenPartTwoState();
}

class _AuthCheckScreenPartTwoState extends State<AuthCheckScreenPartTwo> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      // stream: FirebaseAuth.instance.authStateChanges(),
      stream: Auth(auth: _auth).user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          debugPrint(snapshot.data.toString());

          // If user's Id == null, go to Login Page, otherwise Home:
          if (snapshot.data?.uid == null) {
            return LoginScreen();
          } else {
            return HomeScreen();
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text("Boohoo222~"),
            ),
          );
        }
      },
    );
  }
}
