import 'package:flutter/material.dart';
import '../../../constants/constants.dart';

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
class SpeedDialWidget extends StatelessWidget {
  const SpeedDialWidget({
    Key? key,
    required this.isDialOpen,
  }) : super(key: key);

  final ValueNotifier<bool> isDialOpen;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: const Color(kSpeedDialColor),
      icon: Icons.add,
      activeIcon: Icons.close,
      spacing: 3,
      openCloseDial: isDialOpen,
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () => debugPrint('DIAL CLOSED'),
      useRotationAnimation: true,
      tooltip: 'Open Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      elevation: 8.0,
      isOpenOnStart: false,
      animationSpeed: 200,
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
            })
      ],
    );
  }
}
