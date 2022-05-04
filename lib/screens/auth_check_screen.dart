import 'package:custom_firebase_whatsapp/screens/auth_check_screen_part2.dart';
import 'package:custom_firebase_whatsapp/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';

/// Models:

/// Screens:

/// Widgets:
import 'login/login_screen.dart';

/// Services:
import 'package:firebase_core/firebase_core.dart';
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
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container();
    // return FutureBuilder(
    //   future: _initialization,
    //   builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
    //     if (snapshot.hasError) {
    //       debugPrint(snapshot.error.toString());
    //       return const Scaffold(
    //         body: Center(
    //           child: Text("Error"),
    //         ),
    //       );
    //     }
    //
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       return AuthCheckScreenPartTwo();
    //     }
    //
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Scaffold(
    //         body: Center(
    //           child: CircularProgressIndicator(),
    //         ),
    //       );
    //     } else {
    //       return Center(
    //         child: Text("Bohoo~"),
    //       );
    //     }
    //   },
    // );
  }
}
