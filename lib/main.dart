import 'package:flutter/material.dart';
import 'package:my_first_app/home_screen_mc_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomeScreenMcFlutter(),
    );
  }
}
