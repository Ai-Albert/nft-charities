import 'package:flutter/material.dart';
import 'package:nft_charities/pages/home.dart';
import 'package:nft_charities/services/database.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NFT-Charities',
      home: landing(),
    );
  }

  Widget landing() {
    return Provider<Database>(
      create: (_) => FirestoreDatabase(),
      child: const Home(),
    );
  }
}