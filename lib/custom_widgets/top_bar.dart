import 'package:flutter/material.dart';
import 'package:nft_charities/custom_widgets/top_bar_button.dart';
import '../pages/home.dart';
import '../pages/collections.dart';
import '../pages/roadmap.dart';
import '../pages/about.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

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
                child: Image.asset('pfp.jpg', height: 50, width: 50),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TopBarButton(title: 'Home', builder: (_, __, ___) => const Home()),
                  const SizedBox(width: 50),
                  TopBarButton(title: 'Roadmap', builder: (_, __, ___) => const Roadmap()),
                  const SizedBox(width: 50),
                  TopBarButton(title: 'Collections', builder: (_, __, ___) => const Collections()),
                  const SizedBox(width: 50),
                  TopBarButton(title: 'About', builder: (_, __, ___) => const About()),
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
