import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nft_charities/custom_widgets/bottom_bar.dart';
import 'package:nft_charities/custom_widgets/primary_button.dart';
import 'package:nft_charities/custom_widgets/secondary_button.dart';
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

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
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
            _opening(),
            _mission(),
            const BottomBar(),
          ],
        ),
      ),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollToTop,
              child: const Icon(Icons.arrow_upward),
            ),
    );
  }

  Widget _opening() {
    return Stack(
      alignment: Alignment.center,
      children: [
        _blurredBackground(),
        _greeting(),
      ],
    );
  }

  Widget _blurredBackground() {
    return Container(
      height: MediaQuery.of(context).size.height - 70,
      width: MediaQuery.of(context).size.width,
      color: Colors.indigo[700],
      child: Stack(
        children: [
          Image.asset('ocean.jpg'),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 70,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _greeting() {
    return Column(
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
          'Help clean the ocean today with our most recent collection (minting on OpenSea)', // TODO: change this message every time a new collection drops
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 50),
        const Icon(Icons.arrow_downward,
            size: 50, color: Colors.white),
        const SizedBox(height: 50),
        _siteButtons(),
      ],
    );
  }

  Widget _siteButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PrimaryButton(
          label: 'Visit our OpenSea',
          onPressed: () async {
            const url = "https://opensea.io/NFT-Charities";
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw "Could not launch $url";
            }
          },
        ),
        const SizedBox(width: 50),
        SecondaryButton(
          label: 'Visit our Rarible',
          onPressed: () async {
            const url = "https://rarible.com/nft-charities";
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw "Could not launch $url";
            }
          },
        ),
      ],
    );
  }

  Widget _mission() {
    return Container();
  }
}
