import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nft_charities/firebase_options.dart';
import 'package:nft_charities/page.dart';
import 'package:nft_charities/pages/roadmap.dart';
import 'package:nft_charities/services/database.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NFT-Charities',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: landing(context),
    );
  }

  Widget landing(BuildContext context) {
    return Provider<Database>(
      create: (_) => FirestoreDatabase(),
      child: const ParentPage(),
    );
  }
}