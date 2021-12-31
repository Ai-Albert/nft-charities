import 'package:flutter/material.dart';
import 'package:nft_charities/custom_widgets/bottom_bar.dart';
import 'package:nft_charities/custom_widgets/top_bar.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Roadmap extends StatefulWidget {
  const Roadmap({Key? key}) : super(key: key);

  @override
  _RoadmapState createState() => _RoadmapState();
}

class _RoadmapState extends State<Roadmap> with TickerProviderStateMixin {
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
    _scrollController.animateTo(0, duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 20, 20, 1),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const TopBar(),
            _roadmap(),
            const BottomBar(),
          ],
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


  Widget _roadmap() {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 70,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GradientText(
              'Milestones',
              style: const TextStyle(
                fontSize: 50.0,
                letterSpacing: 3,
              ),
              colors: [
                Colors.blueAccent[200]!,
                Colors.purpleAccent[100]!,
              ],
            ),
          ),
          _roadmapItems(),
        ],
      ),
    );
  }

  // TODO: list of roadmap items could be done using database and listbuilder

  Widget _roadmapItems() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(200, 50, 200, 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _roadMapItem(false, 'Launch our first collection'),
          _roadMapItem(false, 'Sell 5 NFTs'),
          _roadMapItem(false, 'Sell out a collection'),
          _roadMapItem(false, 'Raise and donate \$10,000'),
          _roadMapItem(false, 'Partner with an NFT artist'),
          // _roadMapItem(false, 'Convert the company into a DAO'),
        ],
      ),
    );
  }

  Widget _roadMapItem(bool completed, String goal) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 400,
        child: Card(
          color: completed ? Colors.green[400] : Colors.white,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              children: [
                Icon(
                  completed ? Icons.done : Icons.circle_outlined,
                  color: completed ? Colors.white : Colors.black,
                  size: 30,
                ),
                const SizedBox(width: 10),
                Text(
                  goal,
                  style: TextStyle(
                    color: completed ? Colors.white : Colors.black,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
