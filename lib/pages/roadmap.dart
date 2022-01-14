import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nft_charities/custom_widgets/bottom_bar.dart';
import 'package:nft_charities/custom_widgets/top_bar.dart';
import 'package:nft_charities/models/milestone.dart';
import 'package:nft_charities/pages/helpers/milestone_list_tile.dart';
import 'package:nft_charities/services/database.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'helpers/list_items_builder.dart';

class Roadmap extends StatefulWidget {
  const Roadmap({Key? key}) : super(key: key);

  @override
  _RoadmapState createState() => _RoadmapState();
}

class _RoadmapState extends State<Roadmap> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollbar = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 70,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GradientText(
                  'Milestones',
                  style: const TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  ),
                  colors: [
                    Colors.blueAccent[200]!,
                    Colors.purpleAccent[100]!,
                  ],
                ),
              ),
              const SizedBox(height: 100),
              _message(),
              const SizedBox(height: 50),
              _roadmap(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _message() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
      child: Text(
        'As our company grows and becomes larger in the NFT space, these are some of the things that you will be helping us accomplish. '
        'Support charities by trading our collections, and these goals will become more ambitious.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          letterSpacing: 2,
        ),
      ),
    );
  }

  Widget _roadmap() {
    return _buildRoadmapItems();
  }

  // TODO: fix the snapshot error that's occuring in the stream operation when reading from Firebase
  // Widget _buildRoadmapItems() {
  //   return StreamBuilder<List<Milestone>>(
  //     stream: Provider.of<Database>(context, listen: false).milestonesStream(),
  //     builder: (context, snapshot) {
  //       print(snapshot.hasError);
  //       print(snapshot.error);
  //       return ListItemsBuilder<Milestone>(
  //         scrollController: _scrollController,
  //         context: context,
  //         snapshot: snapshot,
  //         itemBuilder: (context, milestone) => MilestoneListTile(milestone: milestone),
  //         direction: 'horizontal',
  //       );
  //     },
  //   );
  // }

  Widget _buildRoadmapItems() {
    List<Milestone> items = [
      Milestone(id: '1', number: 1, goal: 'Launch our first collection', done: true),
      Milestone(id: '2', number: 2, goal: 'Sell 5 NFTs', done: false),
      Milestone(id: '3', number: 3, goal: 'Sell out a collection', done: false),
      Milestone(id: '4', number: 4, goal: 'Donate \$10,000', done: false),
      Milestone(id: '5', number: 5, goal: 'Partner with an NFT artist', done: false),
      Milestone(id: '6', number: 6, goal: 'Implement a voting system for the charities supported in each collection', done: false),
    ];
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: RawScrollbar(
        isAlwaysShown: true,
        thumbColor: Colors.grey[900],
        interactive: true,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        controller: _scrollbar,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: _scrollbar,
          itemCount: items.length,
          // padding: EdgeInsets.only(
          //   top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top + 24,
          //   bottom: 62 + MediaQuery.of(context).padding.bottom,
          // ),
          // separatorBuilder: (context, index) => const Divider(height: 0.5),
          itemBuilder: (context, index) {
            return MilestoneListTile(milestone: items[index]);
          },
        ),
      ),
    );
  }
}
