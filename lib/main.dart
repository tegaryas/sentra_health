import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sentra_health/features/authentication/presentation/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.white, // Color for Android
          systemNavigationBarColor: Colors.white,
          statusBarBrightness:
              Brightness.light // Dark == white status bar -- for IOS.
          ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
