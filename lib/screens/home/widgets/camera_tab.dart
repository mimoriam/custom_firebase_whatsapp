import 'package:flutter/material.dart';

/// Models:

/// Screens:

/// Widgets:

/// Services:

/// State:

/// Utils/Helpers:
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/camerapreview.dart';
import 'package:camerawesome/generated/i18n.dart';
import 'package:camerawesome/models/capture_modes.dart';
import 'package:camerawesome/models/flashmodes.dart';
import 'package:camerawesome/models/orientations.dart';
import 'package:camerawesome/models/sensor_data.dart';
import 'package:camerawesome/models/sensors.dart';
import 'package:camerawesome/picture_controller.dart';
import 'package:camerawesome/video_controller.dart';
import 'package:flutter/services.dart';

/// Entry Point:
class CameraTab extends StatefulWidget {
  final TabController controller;

  const CameraTab({Key? key, required this.controller}) : super(key: key);

  @override
  State<CameraTab> createState() => _CameraTabState();
}

class _CameraTabState extends State<CameraTab> with TickerProviderStateMixin {
  final ValueNotifier<CameraFlashes> _switchFlash = ValueNotifier(CameraFlashes.NONE);
  final ValueNotifier<Sensors> _sensor = ValueNotifier(Sensors.BACK);
  final ValueNotifier<CaptureModes> _captureMode = ValueNotifier(CaptureModes.PHOTO);
  final ValueNotifier<Size> _photoSize = ValueNotifier(Size(1920, 1080));
  final ValueNotifier<double> _zoom = ValueNotifier(0.64);

  // Controllers
  final PictureController _pictureController = PictureController();
  final VideoController _videoController = VideoController();

  @override
  Widget build(BuildContext context) {
    return CameraAwesome(
      testMode: false,
      onPermissionsResult: (bool? result) {},
      selectDefaultSize: (List<Size> availableSizes) => Size(1920, 1080),
      onCameraStarted: () {},
      onOrientationChanged: (CameraOrientations? newOrientation) {},
      zoom: _zoom,
      sensor: _sensor,
      photoSize: _photoSize,
      switchFlashMode: _switchFlash,
      captureMode: _captureMode,
      orientation: DeviceOrientation.portraitUp,
      fitted: true,
    );
  }
}
