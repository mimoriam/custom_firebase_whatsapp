import 'package:flutter/material.dart';

/// Models:

/// Screens:

/// Widgets:

/// Services:

/// State:

/// Utils/Helpers:
import '../../utils/responsive_helper.dart';

/// Entry Point:
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ResponsiveHelper(
          mobile: Container(),
          tablet: Container(),
          desktop: Container(),
        ),
      ),
    );
  }
}
