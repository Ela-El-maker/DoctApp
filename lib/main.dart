import 'package:doctapp/main_layout.dart';
import 'package:doctapp/screens/auth_page.dart';
import 'package:doctapp/utils/config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   // This is for push navigator
  static final navigatorKey = GlobalKey<NavigatorState>();


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'DoctApp',
      theme: ThemeData(
        // pre-define input decoration
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.outlinedBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlinedBorder,
          floatingLabelStyle: TextStyle(
            color: Config.primaryColor
          ),
          prefixIconColor: Config.blackColor,
        ),
        scaffoldBackgroundColor: Config.whiteColor,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Config.whiteColor,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Config.greyColor,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const AuthPage(),
        'main' : (context) => const MainLayout(),
      },
    );
  }
}


