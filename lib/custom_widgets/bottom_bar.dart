import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_charities/custom_widgets/bottom_bar_button.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(35, 35, 35, 1),
      child: Column(
        children: [
          SizedBox(
            height: 10.0,
            width: MediaQuery.of(context).size.width,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  '© 2022 NFT-Charities',
                  style: GoogleFonts.muli(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: const [
              //     BottomBarButton(title: 'Privacy Policy', url: ''),
              //     SizedBox(width: 30),
              //     BottomBarButton(title: 'Terms of Service', url: ''),
              //     SizedBox(width: 20),
              //   ],
              // ),
              const SizedBox(height: 20),
            ],
          ),
          SizedBox(
            height: 10.0,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
