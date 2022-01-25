import 'package:flutter/material.dart';
import 'package:nft_charities/custom_widgets/bottom_bar.dart';
import 'package:nft_charities/custom_widgets/top_bar.dart';
import 'package:nft_charities/models/nft_collection.dart';
import 'package:nft_charities/pages/helpers/collection_list_tile.dart';
import 'package:nft_charities/services/database.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'helpers/list_items_builder.dart';

class Collections extends StatefulWidget {
  const Collections({Key? key}) : super(key: key);

  @override
  _CollectionsState createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 70,
        maxHeight: MediaQuery.of(context).size.height - 70,
      ),
      child: Column(
        children: [
          _buildDonationAmount(),
          _buildCollections(),
        ],
      ),
    );
  }

  Widget _buildDonationAmount() {
    return Column(
      children: [
        const SizedBox(height: 110),
        GradientText(
          'Total Donations',
          style: const TextStyle(
            fontSize: 50.0,
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
          ),
          colors: [
            Colors.blueAccent[200]!,
            Colors.purpleAccent[100]!,
          ],
        ),
        const SizedBox(height: 25),
        Image.asset(
          'assets/piggy_bank.png',
          width: 300,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 10),
        const SelectableText(
          '0 eth ≈ \$0',
          style: TextStyle(
            fontSize: 50,
            letterSpacing: 3,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildCollections() {
    return _buildCollectionItems();
  }

  // TODO: fix the snapshot error that's occuring in the stream operation when reading from Firebase
  // Widget _buildCollectionItems() {
  //   return StreamBuilder<List<NFTCollection>>(
  //     stream: Provider.of<Database>(context, listen: false).collectionsStream(),
  //     builder: (context, snapshot) {
  //       return ListItemsBuilder<NFTCollection>(
  //         scrollController: _scrollController,
  //         context: context,
  //         snapshot: snapshot,
  //         itemBuilder: (context, collection) => CollectionListTile(collection: collection),
  //         direction: 'vertical',
  //       );
  //     },
  //   );
  // }

  // Widget _buildCollectionItems() {
  //   List<NFTCollection> items = [
  //     NFTCollection(id: id, name: name, releaseDate: releaseDate, moneyRaised: moneyRaised, charities: charities)
  //   ];
  //   return SizedBox(
  //     width: MediaQuery.of(context).size.width,
  //     height: 300,
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       controller: _scrollController,
  //       itemCount: items.length,
  //       itemBuilder: (context, index) {
  //         return CollectionListTile(collection: items[index]);
  //       },
  //     ),
  //   );
  // }

  Widget _buildCollectionItems() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: const [
          SizedBox(height: 100),
          SelectableText(
            'We will be launching our first collection shortly!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}
