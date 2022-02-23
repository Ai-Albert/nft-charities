import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_charities/custom_widgets/primary_button.dart';
import 'package:nft_charities/custom_widgets/secondary_button.dart';
import 'package:nft_charities/responsive_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _opening(),
        _mission(),
        SizedBox(
          child: const Divider(
            thickness: 2,
            color: Color.fromRGBO(40, 40, 40, 1),
          ),
          width: ResponsiveWidget.isSmallScreen(context) ?
            MediaQuery.of(context).size.width - 100 :
            MediaQuery.of(context).size.width - 200,
        ),
        _social(),
      ],
    );
  }

  Widget _opening() {
    return Stack(
      children: [
        _blurredBackground(),
        _greeting(),
      ],
    );
  }

  Widget _blurredBackground() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset(
              'assets/dog.jpg', // TODO: change this when a new collection comes out
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          ClipRect(
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
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
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ResponsiveWidget.isSmallScreen(context) ? phoneGreeting() : desktopGreeting(),
    );
  }

  Widget desktopGreeting() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SelectableText(
          'The world\'s first NFT-based fundraiser for charities',
          style: GoogleFonts.muli(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 75),
        SelectableText(
          'Help rescue dogs today with our most recent collection (minting on OpenSea)', // TODO: change this message every time a new collection drops
          style: GoogleFonts.muli(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              letterSpacing: 2,
            ),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
        const Icon(Icons.arrow_downward,
            size: 50, color: Colors.white),
        const SizedBox(height: 50),
        _siteButtons(),
      ],
    );
  }

  Widget phoneGreeting() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SelectableText(
          'Welcome to\nNFT-Charities',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
          textAlign: TextAlign.center,
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
    return ResponsiveWidget.isSmallScreen(context) ?
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
        const SizedBox(height: 25),
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
    ) :
    Row(
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
      padding: ResponsiveWidget.isSmallScreen(context) ?
        const EdgeInsets.fromLTRB(50, 25, 50, 25) :
        const EdgeInsets.fromLTRB(200, 100, 200, 100),
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
    return ResponsiveWidget.isSmallScreen(context) ?
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: MediaQuery.of(context).size.width),
        GradientText(
          'Our Mission',
          style: GoogleFonts.muli(
            textStyle: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          colors: [
            Colors.blueAccent[200]!,
            Colors.purpleAccent[100]!,
          ],
        ),
        const SizedBox(height: 15),
        SelectableText(
          'Most NFTs on the market don\'t have any utility. '
              'They don\'t serve any purpose or have any uses.\n\nHowever, we at NFT Charities see an opportunity for these tokens '
              'to impact people not only through social spaces, but through charities as well.\n\n'
              'By tapping into this new marketplace and partnering with artists in this space, we will be able to raise '
              'more money for these causes than by conventional means.',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontSize: 20, height: 1.5, letterSpacing: 1, color: Colors.white),
          ),
        ),
      ],
    ) :
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientText(
                'Our Mission',
                style: GoogleFonts.muli(
                  textStyle: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                colors: [
                  Colors.blueAccent[200]!,
                  Colors.purpleAccent[100]!,
                ],
              ),
              const SizedBox(height: 30),
              SelectableText(
                'Most NFTs on the market don\'t have any utility. '
                    'They don\'t serve any purpose or have any uses.\n\nHowever, we at NFT Charities see an opportunity for these tokens '
                    'to impact people not only through social spaces, but through charities as well.\n\n'
                    'By tapping into this new marketplace and partnering with artists in this space, we will be able to raise '
                    'more money for these causes than by conventional means.',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 20, height: 1.5, letterSpacing: 1, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 100),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 250,
          height: 400,
          child: Image.asset(
            'assets/giving.png',
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  Widget _missionContentTwo() {
    return ResponsiveWidget.isSmallScreen(context) ?
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GradientText(
          'How It Works',
          style: GoogleFonts.muli(
            textStyle: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          colors: [
            Colors.blueAccent[200]!,
            Colors.purpleAccent[100]!,
          ],
        ),
        const SizedBox(height: 15),
        SelectableText(
          '\u2022 75% of initial sales proceeds are equally donated to the charities listed in the collection description\n'
              '\u2022 75% of the 10% secondary sale royalties are also donated\n'
              '\u2022 The rest of the proceeds go towards marketing, development, etc... costs\n'
              '\u2022 Receipts/proof of donations will be posted on our Twitter at the end of each week in which we receive proceeds\n',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontSize: 20, height: 1.5, letterSpacing: 1,color: Colors.white),
          ),
        ),
      ],
    ) :
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 250,
          height: 400,
          child: Image.asset(
            'assets/eth_coin.png',
            fit: BoxFit.contain,
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
                style: GoogleFonts.muli(
                  textStyle: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                colors: [
                  Colors.blueAccent[200]!,
                  Colors.purpleAccent[100]!,
                ],
              ),
              const SizedBox(height: 30),
              SelectableText(
                '\u2022 75% of initial sales proceeds are equally donated to the charities listed in the collection description\n'
                  '\u2022 75% of the 10% secondary sale royalties are also donated\n'
                  '\u2022 The rest of the proceeds go towards marketing, development, etc... costs\n'
                  '\u2022 Receipts/proof of donations will be posted on our Twitter at the end of each week in which we receive proceeds\n',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 20, height: 1.5, letterSpacing: 1,color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _social() {
    return Padding(
      padding: ResponsiveWidget.isSmallScreen(context) ?
        const EdgeInsets.fromLTRB(40, 25, 40, 25) :
        const EdgeInsets.fromLTRB(80, 50, 100, 50),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ResponsiveWidget.isSmallScreen(context) ? _profiles() : Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _profiles(),
            //_twitterFeed(),
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
              style: GoogleFonts.muli(
                textStyle: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
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
              _socialButton('assets/instagram.png', 'Instagram', 'https://www.instagram.com/nft.charities/'),
              _socialButton('assets/twitter.png', 'Twitter', 'https://twitter.com/nft_charities'),
              // _socialButton('assets/facebook.png', 'Facebook', ''), // TODO: update when facebook is set up
              _socialButton('assets/tiktok.png', 'TikTok', 'https://vm.tiktok.com/TTPdhS7cJD/'),
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
          ResponsiveWidget.isSmallScreen(context) ? Container() : const SizedBox(width: 5),
          ResponsiveWidget.isSmallScreen(context) ? Container() : GradientText(
            name,
            style: GoogleFonts.muli(
              textStyle: const TextStyle(
                fontSize: 20.0,
                letterSpacing: 1,
              ),
            ),
            colors: [
              Colors.blueAccent[200]!,
              Colors.purpleAccent[100]!,
            ],
          ),
          ResponsiveWidget.isSmallScreen(context) ? Container() :const SizedBox(width: 20),
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
          (int viewId) {
            IFrameElement _iFrame = IFrameElement();
            _iFrame.src = "twitter.html";
            _iFrame.style.width = "100%";
            _iFrame.style.height = "100%";
            _iFrame.style.border = "none";
            return _iFrame;
          },
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
