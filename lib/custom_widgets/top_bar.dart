import 'package:flutter/material.dart';
import 'package:nft_charities/custom_widgets/top_bar_button.dart';
import 'package:nft_charities/services/database.dart';
import '../pages/home.dart';
import '../pages/collections.dart';
import '../pages/roadmap.dart';
import '../pages/about.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  TopBar({
    Key? key,
    required this.home,
    required this.roadmap,
    required this.collections,
    required this.about,
    required this.opacity,
  }) : super(key: key);

  final VoidCallback home;
  final VoidCallback roadmap;
  final VoidCallback collections;
  final VoidCallback about;
  final double opacity;

  List isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: const Color.fromRGBO(30, 30, 30, 1).withOpacity(opacity),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 20),
              Image.asset('assets/pfp.png', width: 50, height: 50),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TopBarButton(
                      title: 'Home',
                      onPressed: home,
                      isHovering: isHovering,
                      index: 0,
                    ),
                    SizedBox(width: screenSize.width / 20),
                    TopBarButton(
                      title: 'Roadmap',
                      onPressed: roadmap,
                      isHovering: isHovering,
                      index: 1,
                    ),
                    SizedBox(width: screenSize.width / 20),
                    TopBarButton(
                      title: 'Collections',
                      onPressed: collections,
                      isHovering: isHovering,
                      index: 2,
                    ),
                    SizedBox(width: screenSize.width / 20),
                    TopBarButton(
                      title: 'About',
                      onPressed: about,
                      isHovering: isHovering,
                      index: 3,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 70, height: 50),
            ],
          ),
        ),
      ),
    );
  }
}