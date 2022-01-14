import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:nft_charities/custom_widgets/bottom_bar.dart';
import 'package:nft_charities/custom_widgets/primary_button.dart';
import 'package:nft_charities/custom_widgets/secondary_button.dart';
import 'package:nft_charities/custom_widgets/top_bar.dart';
import 'package:nft_charities/services/database.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          _opening(),
          _mission(),
          SizedBox(
            child: const Divider(
              thickness: 2,
              color: Color.fromRGBO(40, 40, 40, 1),
            ),
            width: MediaQuery.of(context).size.width - 200,
          ),
          _social(),
        ],
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
    return SizedBox(
      height: MediaQuery.of(context).size.height - 70,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'ocean.jpg',
              height: MediaQuery.of(context).size.height - 70,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
          ClipRect(
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
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
    return SizedBox(
      height: MediaQuery.of(context).size.height - 70,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'The world\'s first NFT-based fundraiser for charities',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 75),
          const Text(
            'Help clean the ocean today with our most recent collection (minting on OpenSea)', // TODO: change this message every time a new collection drops
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 50),
          const Icon(Icons.arrow_downward,
              size: 50, color: Colors.white),
          const SizedBox(height: 50),
          _siteButtons(),
        ],
      ),
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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: _missionContent(),
    );
  }

  Widget _missionContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(200, 100, 200, 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width),
          _missionContentOne(),
          const SizedBox(height: 50),
          _missionContentTwo(),
        ],
      ),
    );
  }

  Widget _missionContentOne() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientText(
                'Our Mission',
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                colors: [
                  Colors.blueAccent[200]!,
                  Colors.purpleAccent[100]!,
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Most NFTs on the market don\'t have any utility. '
                    'They don\'t serve any purpose or have any uses. However, we at NFT Charities see an opportunity for these tokens '
                    'to impact people not only through social spaces, but through charities as well. '
                    'By tapping into this new marketplace and partnering with artists in this space, we will be able to raise '
                    'more money for these causes than by conventional means.',
                style: TextStyle(fontSize: 20, height: 1.5, letterSpacing: 1, color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(width: 100),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 250,
          child: Positioned.fill(
            child: Image.asset(
              'illustrations/giving.png',
              height: 400,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  Widget _missionContentTwo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 250,
          child: Positioned.fill(
            child: Image.asset(
              'illustrations/eth_coin.png',
              height: 400,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(width: 100),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientText(
                'How It Works',
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                colors: [
                  Colors.blueAccent[200]!,
                  Colors.purpleAccent[100]!,
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                '\u2022 75% of initial sales proceeds are equally donated to the charities listed in the collection description\n'
                  '\u2022 75% of the 10% secondary sale royalties are also donated\n'
                  '\u2022 The rest of the proceeds go towards marketing, development, etc... costs\n'
                  '\u2022 Receipts/proof of donations will be posted on our Twitter at the end of each week in which we receive proceeds\n',
                style: TextStyle(fontSize: 20, height: 1.5, letterSpacing: 1,color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _social() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(80, 50, 100, 50),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _profiles(),
            _twitterFeed(),
          ],
        ),
      ),
    );
  }

  Widget _profiles() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5 * 3 - 80,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: GradientText(
              'Connect With Us',
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
              colors: [
                Colors.blueAccent[200]!,
                Colors.purpleAccent[100]!,
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _socialButton('socials/instagram.png', 'Instagram', 'https://www.instagram.com/nft.charities/'),
              _socialButton('socials/twitter.png', 'Twitter', 'https://twitter.com/nft_charities'),
              // _socialButton('socials/facebook.png', 'Facebook', ''), // TODO: update when facebook and tiktok are set up
              // _socialButton('socials/tiktok.png', 'TikTok', ''),
            ],
          ),
        ],
      ),
    );
  }

  Widget _socialButton(String icon, String name, String link) {
    return OutlinedButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(icon, width: 50, height: 50),
          const SizedBox(width: 5),
          GradientText(
            name,
            style: const TextStyle(
              fontSize: 20.0,
              letterSpacing: 1,
            ),
            colors: [
              Colors.blueAccent[200]!,
              Colors.purpleAccent[100]!,
            ],
          ),
          const SizedBox(width: 20),
        ],
      ),
      onPressed: () async {
        if (await canLaunch(link)) {
          await launch(link);
        } else {
          throw "Could not launch $link";
        }
      },
    );
  }

  Widget _twitterFeed() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'twitter',
          (int uid) => IFrameElement()
            ..src = 'web/twitter.html'
            ..style.border = "none",
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5 * 2 - 100,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const HtmlElementView(viewType: 'twitter'),
        ),
      ),
    );
  }
}
