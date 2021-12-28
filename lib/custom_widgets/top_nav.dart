import 'package:flutter/material.dart';
import 'package:nft_charities/custom_widgets/top_nav_button.dart';
import '../pages/home.dart';
import '../pages/history.dart';
import '../pages/roadmap.dart';
import '../pages/about.dart';

class TopNav extends StatelessWidget {
  const TopNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            const Opacity(
              opacity: 0,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: TextButton(
                  child: Text(
                    'Contact',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  onPressed: null,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TopNavButton(title: 'Home', builder: (_, __, ___) => const Home()),
                const SizedBox(width: 50),
                TopNavButton(title: 'History', builder: (_, __, ___) => const History()),
                const SizedBox(width: 50),
                TopNavButton(title: 'Roadmap', builder: (_, __, ___) => const Roadmap()),
                const SizedBox(width: 50),
                TopNavButton(title: 'About', builder: (_, __, ___) => const About()),
              ],
            ),
            Opacity(
              opacity: 0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Image.asset('pfp.jpg', height: 50, width: 50),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: TextButton(
                child: const Text(
                  'Contact',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
          width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }
}
