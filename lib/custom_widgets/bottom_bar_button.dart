import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomBarButton extends StatelessWidget {
  const BottomBarButton({Key? key, required this.title, required this.url}) : super(key: key);

  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        title,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 10,
          ),
        ),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: () async {
        if (await canLaunch(url)) {
          await launch(url);
        }
        else {
          throw "Could not launch $url";
        }
      }
    );
  }
}
