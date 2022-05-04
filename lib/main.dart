// import 'package:flutter/foundation.dart';
import 'package:custom_firebase_whatsapp/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:form_builder_validators/localization/l10n.dart';

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
  await Firebase.initializeApp();
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
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // User is signed in:
            return HomeScreen();
          } else {
            return SignInScreen(
              providerConfigs: [
                EmailProviderConfiguration(),
                GoogleProviderConfiguration(
                  clientId: '209011713144-v4qlip2nforpr70mdurnbgqnqj9espit.apps.googleusercontent.com',
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
