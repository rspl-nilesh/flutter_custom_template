import 'package:example_app/example_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_template/core/utils/ui_extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        // Providing a restorationScopeId allows the Navigator built by the
        // MaterialApp to restore the navigation stack when a user leaves and
        // returns to the app after it has been killed while running in the
        // background.
        restorationScopeId: "app",
        scaffoldMessengerKey: snackbarKey,
        // Provide the generated AppLocalizations to the MaterialApp. This
        // allows descendant Widgets to display the correct translations
        // depending on the user's locale.
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const <Locale>[
          Locale('en', ''), // English, no country code
        ],

        // Use AppLocalizations to configure the correct application title
        // depending on the user's locale.
        //
        // The appTitle is defined in .arb files found in the localization
        // directory.
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context)!.appTitle,

        // Define a light and dark color theme. Then, read the user's
        // preferred ThemeMode (light, dark, or system default) from the
        // SettingsController to display the correct theme.
        theme: ThemeData(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.light,

        // Define a function to handle named routes in order to support
        // Flutter web url navigation and deep linking.
        onGenerateRoute: (RouteSettings routeSettings) =>
            MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) =>
              const HomePage(),
        ),
      );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Text(AppLocalizations.of(context)!.appTitle),
              ElevatedButton(
                onPressed: () => _methodCheck(context),
                child: const Text("Hello"),
              )
            ],
          ),
        ),
      );

  void _methodCheck(BuildContext context) {
    const String a = "Hello";
    debugPrint(a);
    context.showAlertDialog(
      message: "This is message",
      negativeButton: TextButton(
        onPressed: () {},
        child: const Text('No'),
      ),
      positiveButton: TextButton(
        onPressed: () {},
        child: const Text('Yes'),
      ),
    );
    context.showSnackBar(message: "message");
  }
}
