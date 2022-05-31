import 'dart:io';
import 'package:catbreeds/constants.dart';
import 'package:catbreeds/pages/landing_page.dart';
import 'package:catbreeds/pages/more_info_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CatBreeds',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: primaryColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: bgColor,
      ),
      home: const LandingPage(),
      routes: {
        "/landingpage": (context) => LandingPage(),
        "/moreinfopage": (context) => MoreInfoPage(),
      },
    );
  }
}
