import 'package:flutter/material.dart';

/// Models:

/// Screens:
import 'home/home_screen.dart';
import 'login/login_screen.dart';

/// Widgets:

/// Services:
import '../services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// State:

/// Utils/Helpers:

/// Entry Point:
class AuthCheckScreen extends StatefulWidget {
  const AuthCheckScreen({Key? key}) : super(key: key);

  @override
  State<AuthCheckScreen> createState() => _AuthCheckScreenState();
}

class _AuthCheckScreenState extends State<AuthCheckScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: Auth(auth: _auth).user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          debugPrint(snapshot.data.toString());

          // If user's Id == null, go to Login Page, otherwise Home:
          if (snapshot.data?.uid == null) {
            return const LoginScreen();
          } else {
            return const HomeScreen();
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
