import 'package:flutter/material.dart';

/// Models:

/// Screens:

/// Widgets:

/// Services:

/// State:

/// Utils/Helpers:

/// Entry Point:
class CameraTab extends StatefulWidget {
  final TabController controller;

  const CameraTab({Key? key, required this.controller}) : super(key: key);

  @override
  State<CameraTab> createState() => _CameraTabState();
}

class _CameraTabState extends State<CameraTab> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: GestureDetector(
        onTap: () {
          widget.controller.animateTo(1);
        },
        child: Icon(
          Icons.directions_car,
          size: 350,
        ),
      ),
    );
  }
}
