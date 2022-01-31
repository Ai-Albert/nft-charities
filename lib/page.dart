import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:nft_charities/custom_widgets/bottom_bar.dart';
import 'package:nft_charities/custom_widgets/top_bar.dart';
import 'package:nft_charities/pages/about.dart';
import 'package:nft_charities/pages/collections.dart';
import 'package:nft_charities/pages/home.dart';
import 'package:nft_charities/pages/roadmap.dart';
import 'package:nft_charities/responsive_widget.dart';

import 'custom_widgets/top_bar_button.dart';

class CustomScrollBehaviour extends MaterialScrollBehavior {
  const CustomScrollBehaviour();

  @override
  Widget buildScrollbar(
      BuildContext context,
      Widget child,
      ScrollableDetails details,
      ) {
    switch (getPlatform(context)) {
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
        return Scrollbar(
          controller: details.controller,
          isAlwaysShown: true,
          child: child,
        );
      case TargetPlatform.windows:
        return Scrollbar(
          controller: details.controller,
          isAlwaysShown: true,
          radius: Radius.zero,
          thickness: 16.0,
          hoverThickness: 16.0,
          showTrackOnHover: true,
          child: child,
        );
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.iOS:
        return child;
    }
  }
}

class ParentPage extends StatefulWidget {
  const ParentPage({Key? key}) : super(key: key);

  @override
  _ParentPageState createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> with TickerProviderStateMixin {
  bool _showBackToTopButton = false;
  final List<Widget> _pages = [const Home(), const Roadmap(), const Collections(), const About()];
  int _currPage = 0;

  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  List isHovering = [false, false, false, false];

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

    _scrollController.addListener(() {
      setState(() {
        _scrollPosition = _scrollController.position.pixels;
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
    _scrollController.animateTo(0, duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height
        ? _scrollPosition / (screenSize.height)
        : 1;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 20, 20, 1),
      appBar: ResponsiveWidget.isSmallScreen(context) ?
        PreferredSize(
          preferredSize: Size(screenSize.width, 1000),
          child: Container(),
        ) :
        _topBar(),
      extendBodyBehindAppBar: true,
      body: ImprovedScrolling(
        scrollController: _scrollController,
        enableMMBScrolling: true,
        enableKeyboardScrolling: true,
        enableCustomMouseWheelScrolling: true,
        mmbScrollConfig: const MMBScrollConfig(
          customScrollCursor: DefaultCustomScrollCursor(),
        ),
        keyboardScrollConfig: KeyboardScrollConfig(
          arrowsScrollAmount: 75.0,
          homeScrollDurationBuilder: (currentScrollOffset, minScrollOffset) {
            return const Duration(milliseconds: 100);
          },
          endScrollDurationBuilder: (currentScrollOffset, maxScrollOffset) {
            return const Duration(milliseconds: 2000);
          },
        ),
        customMouseWheelScrollConfig: const CustomMouseWheelScrollConfig(
          scrollAmountMultiplier: 2.0,
        ),
        child: ScrollConfiguration(
          behavior: const CustomScrollBehaviour(),
          child: SingleChildScrollView( // TODO: check pub.dev for smooth scrolling
            physics: ResponsiveWidget.isSmallScreen(context) ? null : const NeverScrollableScrollPhysics(),
            controller: _scrollController,
            child: Column(
              children: [
                _pages[_currPage],
                const BottomBar(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _showBackToTopButton == false ? null : FloatingActionButton(
        onPressed: _scrollToTop,
        child: const Icon(Icons.arrow_upward),
        backgroundColor: Colors.grey[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  PreferredSizeWidget _topBar() {
    var screenSize = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: TopBar(
        home: () {
          setState(() {
            _currPage = 0;
          });
        },
        roadmap: () {
          setState(() {
            _currPage = 1;
          });
        },
        collections: () {
          setState(() {
            _currPage = 2;
          });
        },
        about: () {
          setState(() {
            _currPage = 3;
          });
        },
        opacity: _opacity,
      ),
    );
  }
}
