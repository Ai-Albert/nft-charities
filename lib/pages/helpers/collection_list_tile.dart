import 'package:flutter/material.dart';
import 'package:nft_charities/models/nft_collection.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CollectionListTile extends StatelessWidget {
  const CollectionListTile({Key? key, required this.collection}) : super(key: key);

  final NFTCollection collection;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      margin: const EdgeInsets.all(6.0),
      color: const Color.fromRGBO(30, 30, 30, 1),
      child: Center(
        child: Container(
          child: _buildTile(context),
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          GradientText(
            collection.name,
            style: const TextStyle(
              fontSize: 30.0,
              letterSpacing: 2,
            ),
            colors: [
              Colors.blueAccent[200]!,
              Colors.purpleAccent[100]!,
            ],
          ),
          const SizedBox(width: 250),
          SelectableText(
            collection.formattedDate,
            style: const TextStyle(
              fontSize: 20,
              letterSpacing: 1,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
