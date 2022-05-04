/// Screens:
import 'package:custom_firebase_whatsapp/screens/auth_check_screen_part2.dart';
import '../screens/home/home_screen.dart';
import '../screens/error/error_screen.dart';
import 'package:custom_firebase_whatsapp/screens/login/login_screen.dart';
import 'package:custom_firebase_whatsapp/screens/register/register_screen.dart';
import 'package:custom_firebase_whatsapp/screens/splash/splash_screen.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
  '/auth_check2': (context) => const AuthCheckScreenPartTwo(),
  '/splash': (context) => const SplashScreen(),
  '/error': (context) => ErrorScreen(error: Exception("Error")),
};
