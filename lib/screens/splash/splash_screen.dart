import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Models:

/// Screens:

/// Widgets:

/// Services:

/// State:

/// Utils/Helpers:

/// Entry Point:

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/login');
            },
            child: Text("Go to Login"),
          ),
        ),
      ),
    );
  }
}
