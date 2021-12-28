import 'package:flutter/material.dart';
import 'package:nft_charities/custom_widgets/bottom_bar_button.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
          width: MediaQuery.of(context).size.width,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                '© NFT-Charities, LLC',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                BottomBarButton(title: 'Privacy Policy', url: ''),
                SizedBox(width: 30),
                BottomBarButton(title: 'Terms of Service', url: ''),
                SizedBox(width: 20),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
          width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }
}
