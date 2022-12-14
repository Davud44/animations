import 'package:animations/doggo/doggo_page.dart';
import 'package:flutter/material.dart';

import 'hero/hero.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/hero': (context) => const HeroScreen(),
        '/doggo': (context) => const DoggoPage()
      },
      initialRoute: '/doggo',
    );
  }
}
