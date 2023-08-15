import 'package:catalog_app/widgets/MyTheme.dart';
import 'package:flutter/material.dart';

import 'Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      themeMode: ThemeMode.light,
      theme: MyTheme.lighttheme(context) ,
      darkTheme: MyTheme.darktheme(context),
    );
  }
}
