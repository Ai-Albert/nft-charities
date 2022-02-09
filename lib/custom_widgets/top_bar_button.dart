import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopBarButton extends StatefulWidget {
  TopBarButton({
    Key? key, required this.title,
    required this.onPressed,
    required this.isHovering,
    required this.index,
  });

  final String title;
  final VoidCallback onPressed;
  List isHovering;
  final int index;

  @override
  State<TopBarButton> createState() => _TopBarButtonState();
}

class _TopBarButtonState extends State<TopBarButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onHover: (value) {
        setState(() {
          widget.isHovering[widget.index] = value;
        });
      },
      onTap: widget.onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                letterSpacing: 1,
              ),
            ),
          ),
          const SizedBox(height: 5),
          // For showing an underline on hover
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            visible: widget.isHovering[widget.index],
            child: Container(
              height: 2,
              width: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
