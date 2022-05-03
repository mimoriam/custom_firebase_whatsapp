import 'package:flutter/material.dart';

/// Models:

/// Screens:

/// Widgets:
import 'login/login_screen.dart';

/// Services:

/// State:

/// Utils/Helpers:

/// Entry Point:
class AuthCheckScreen extends StatefulWidget {


  const AuthCheckScreen({Key? key}) : super(key: key);

  @override
  State<AuthCheckScreen> createState() => _AuthCheckScreenState();
}

class _AuthCheckScreenState extends State<AuthCheckScreen> {
  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}
