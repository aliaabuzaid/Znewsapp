import 'package:flutter/material.dart';
import 'package:znews/screens/main_screen.dart';
import 'package:znews/screens/splash.dart';
import 'package:znews/sudan_news/sudani.dart';

void main() {
  runApp(MyApp());}
  class MyApp extends StatelessWidget {
  // This widget is the root of your applMainScreen()ication.
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  title: 'Znews',
  theme: ThemeData(

  primarySwatch: Colors.blue,

  visualDensity: VisualDensity.adaptivePlatformDensity,
  ),
  home:MyCustomSplashScreen(),
  );
  }}
