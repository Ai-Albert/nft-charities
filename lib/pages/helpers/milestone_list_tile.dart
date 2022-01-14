import 'package:flutter/material.dart';
import 'package:nft_charities/models/milestone.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class MilestoneListTile extends StatelessWidget {
  const MilestoneListTile({Key? key, required this.milestone}) : super(key: key);

  final Milestone milestone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        constraints: const BoxConstraints(minWidth: 450, maxWidth: 450),
        child: Card(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
          margin: const EdgeInsets.all(6.0),
          color: milestone.done ? Colors.green : const Color.fromRGBO(30, 30, 30, 1),
          child: Center(
            child: _buildTile(context),
          ),
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          GradientText(
            '${milestone.number}',
            style: const TextStyle(
              fontSize: 30.0,
              letterSpacing: 2,
            ),
            colors: [
              milestone.done ? Colors.white : Colors.blueAccent[200]!,
              milestone.done ? Colors.white : Colors.purpleAccent[100]!,
            ],
          ),
          const SizedBox(height: 50),
          Text(
            milestone.goal,
            style: const TextStyle(
              fontSize: 20,
              letterSpacing: 1,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
