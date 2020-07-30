import 'package:discoversu/app/locator.dart';
import 'package:discoversu/app/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: locator<NavigationService>().navigatorKey,
        title: 'Flutter Demo',
        initialRoute: Routes.homeView,
        onGenerateRoute: Router().onGenerateRoute,
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        )));
  }
}
