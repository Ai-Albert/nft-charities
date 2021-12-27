import 'package:flutter/material.dart';
import 'package:nft_charities/custom_widgets/primary_button.dart';
import 'package:nft_charities/custom_widgets/top_nav.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  bool _showBackToTopButton = false;

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(() {
      setState(() {
        if (_scrollController.offset >= 400) {
          _showBackToTopButton = true; // show the back-to-top button
        }
        else {
          _showBackToTopButton = false; // hide the back-to-top button
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  // This function is triggered when the user presses the back-to-top button
  void _scrollToTop() {
    _scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
          child: Column(
            children: [
              const TopNav(),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: Colors.black,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'The world\'s first NFT-based fundraiser for charities',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          letterSpacing: 3,
                        ),
                      ),
                      const SizedBox(height: 75),
                      const Text(
                        'Help clean the ocean today with our most recent collection', // TODO: change this message every time a new collection drops
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 50),
                      const Icon(Icons.arrow_downward, size: 50, color: Colors.white),
                      const SizedBox(height: 50),
                      PrimaryButton(
                        label: 'Visit our OpenSea',
                        onPressed: () async {
                          const url = "https://opensea.io/NFT-Charities";
                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                          else {
                            throw "Could not launch $url";
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
      ),
      floatingActionButton: _showBackToTopButton == false ? null : FloatingActionButton(
        onPressed: _scrollToTop,
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}
