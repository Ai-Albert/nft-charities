import 'package:flutter/material.dart';

class TabDrawer extends StatelessWidget {
  const TabDrawer({
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
    return Drawer(
      child: Container(
        color: const Color.fromRGBO(30, 30, 30, 1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: home,
                child: const Text(
                  'Home',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Color.fromRGBO(40, 40, 40, 1),
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: roadmap,
                child: const Text(
                  'Roadmap',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Color.fromRGBO(40, 40, 40, 1),
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: collections,
                child: const Text(
                  'Collections',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Color.fromRGBO(40, 40, 40, 1),
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: about,
                child: const Text(
                  'About',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}