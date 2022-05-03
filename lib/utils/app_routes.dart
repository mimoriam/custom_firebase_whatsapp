import 'package:custom_firebase_whatsapp/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

/// Models:

/// Screens:
import '../screens/home/home_screen.dart';
import '../screens/error/error_screen.dart';
import 'package:custom_firebase_whatsapp/screens/register/register_screen.dart';

/// Widgets:

/// Services:

/// State:

/// Utils/Helpers:
import 'package:go_router/go_router.dart';

/// Entry Point:
final GoRouter goRouter = GoRouter(
  initialLocation: '/login',
  routes: <GoRoute>[
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
    ),
    GoRoute(
      name: 'register',
      path: '/register',
      builder: (BuildContext context, GoRouterState state) => const RegisterScreen(),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(error: state.error),
);

/// GoRouter.of(context).go('/page2') OR context.go('/page2')
