import 'package:flutter/material.dart';
import 'package:nft_charities/custom_widgets/bottom_bar.dart';
import 'package:nft_charities/custom_widgets/top_nav.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> with TickerProviderStateMixin {
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
              _buildBody(),
              const BottomBar(),
            ],
          ),
      ),
      floatingActionButton: _showBackToTopButton == false ? null : FloatingActionButton(
        onPressed: _scrollToTop,
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height - 70 - 48,
      width: MediaQuery.of(context).size.width,
    );
  }
}
