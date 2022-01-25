import 'package:flutter/material.dart';
import 'package:nft_charities/custom_widgets/top_bar_button.dart';
import 'package:nft_charities/services/database.dart';
import '../pages/home.dart';
import '../pages/collections.dart';
import '../pages/roadmap.dart';
import '../pages/about.dart';

class TopBar extends StatelessWidget {
  TopBar({
    Key? key,
    required this.home,
    required this.roadmap,
    required this.collections,
    required this.about,
  }) : super(key: key);

  final VoidCallback home;
  final VoidCallback roadmap;
  final VoidCallback collections;
  final VoidCallback about;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 10.0,
            width: MediaQuery.of(context).size.width,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Image.asset('assets/pfp.jpg', height: 50, width: 50),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // TopBarButton(title: 'Home', builder: (_, __, ___) => Home(database: database)),
                  TopBarButton(title: 'Home', onPressed: home),
                  const SizedBox(width: 50),
                  // TopBarButton(title: 'Roadmap', builder: (_, __, ___) => Roadmap(database: database)),
                  TopBarButton(title: 'Roadmap', onPressed: roadmap),
                  const SizedBox(width: 50),
                  // TopBarButton(title: 'Collections', builder: (_, __, ___) => Collections(database: database)),
                  TopBarButton(title: 'Collections', onPressed: collections),
                  const SizedBox(width: 50),
                  // TopBarButton(title: 'About', builder: (_, __, ___) => About(database: database)),
                  TopBarButton(title: 'About', onPressed: about),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: SizedBox(
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
