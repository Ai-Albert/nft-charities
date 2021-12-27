import 'package:flutter/material.dart';
import 'package:nft_charities/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        // '/history': (context) => const History(),
        // '/roadmap': (context) => const Roadmap(),
        // '/about': (context) => const About(),
      },
    );
  }
}