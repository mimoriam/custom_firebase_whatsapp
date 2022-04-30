// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Models:

/// Screens:

/// Widgets:

/// Services:

/// State:
import 'package:provider/provider.dart';
import 'state/root_state.dart';
import 'state/theme_state.dart';

/// Utils/Helpers:
import 'utils/app_routes.dart';
// import 'package:device_preview/device_preview.dart';

/// Entry Point:
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => RootStateProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => ThemeStateProvider()),
      ],
      // child: DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => MyApp(),
      // ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: Provider.of<ThemeStateProvider>(context).darkTheme ? ThemeData.light() : ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
    );
  }
}
