// import 'package:flutter/foundation.dart';
import 'package:custom_firebase_whatsapp/screens/auth_check_screen_part2.dart';
import 'package:custom_firebase_whatsapp/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:flutterfire_ui/auth.dart';

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
Future<void> main() async {
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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   theme: Provider.of<ThemeStateProvider>(context).darkTheme ? ThemeData.light() : ThemeData.dark(),
    //   debugShowCheckedModeBanner: false,
    //   routerDelegate: goRouter.routerDelegate,
    //   routeInformationParser: goRouter.routeInformationParser,
    //   // useInheritedMediaQuery: true,
    //   // locale: DevicePreview.locale(context),
    //   // builder: DevicePreview.appBuilder,
    // );

    return MaterialApp(
      // routes: appRoutes,
      initialRoute: '/',
      supportedLocales: [
        Locale('en'),
      ],
      localizationsDelegates: [
        FormBuilderLocalizations.delegate,
      ],
      home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              // Error screen
              debugPrint(snapshot.error.toString());
              return const Scaffold(
                body: Center(
                  child: Text("Error"),
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return AuthCheckScreenPartTwo();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return const Center(
                child: Text("Boohoo~"),
              );
            }
          }),
    );
  }
}
