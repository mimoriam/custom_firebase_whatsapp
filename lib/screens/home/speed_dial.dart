import 'package:flutter/material.dart';
import '../../constants/constants.dart';

/// Models:

/// Screens:

/// Widgets:
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

/// Services:

/// State:
import 'package:provider/provider.dart';
import 'package:custom_firebase_whatsapp/state/theme_state.dart';

/// Utils/Helpers:

/// Entry Point:
class SpeedDialWidget extends StatefulWidget {
  final ValueNotifier<bool> isDialOpen;
  final TabController controller;

  const SpeedDialWidget({Key? key, required this.isDialOpen, required this.controller}) : super(key: key);

  @override
  State<SpeedDialWidget> createState() => _SpeedDialWidgetState();
}

class _SpeedDialWidgetState extends State<SpeedDialWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.controller.index == 0) {
      return Container();
    }

    if (widget.controller.index == 3) {
      return SpeedDial(
        backgroundColor: const Color(kSpeedDialColor),
        icon: Icons.camera_alt_outlined,
        activeIcon: Icons.camera_alt_outlined,
        spacing: 3,
        openCloseDial: widget.isDialOpen,
        onOpen: () => debugPrint('OPENING STATUS DIAL'),
        onClose: () => debugPrint('STATUS DIAL CLOSED'),
        useRotationAnimation: true,
        tooltip: 'Open Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        elevation: 8.0,
        animationDuration: const Duration(milliseconds: 200),
        renderOverlay: false,
        childrenButtonSize: const Size(60.0, 60.0),
      );
    }

    if (widget.controller.index == 4) {
      return SpeedDial(
        backgroundColor: const Color(kSpeedDialColor),
        icon: Icons.call,
        activeIcon: Icons.call,
        spacing: 3,
        openCloseDial: widget.isDialOpen,
        onOpen: () => debugPrint('OPENING CALL DIAL'),
        onClose: () => debugPrint('CALL DIAL CLOSED'),
        useRotationAnimation: true,
        tooltip: 'Open Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        elevation: 8.0,
        animationDuration: const Duration(milliseconds: 200),
        renderOverlay: false,
        childrenButtonSize: const Size(60.0, 60.0),
      );
    }

    return SpeedDial(
      backgroundColor: const Color(kSpeedDialColor),
      icon: Icons.add,
      activeIcon: Icons.close,
      spacing: 3,
      openCloseDial: widget.isDialOpen,
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () => debugPrint('DIAL CLOSED'),
      useRotationAnimation: true,
      tooltip: 'Open Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      elevation: 8.0,
      isOpenOnStart: false,
      animationDuration: const Duration(milliseconds: 200),
      renderOverlay: false,
      childrenButtonSize: const Size(60.0, 60.0),
      children: [
        SpeedDialChild(
            backgroundColor: const Color(kSpeedDialColor),
            child: IconTheme(
              data: IconThemeData(
                color: Provider.of<ThemeStateProvider>(context).darkTheme ? Colors.black : Colors.white,
              ),
              child: const Icon(
                Icons.add_comment_sharp,
              ),
            ),
            onTap: () {
              debugPrint("Onward to create chat screen");
            }),
      ],
    );
  }
}
