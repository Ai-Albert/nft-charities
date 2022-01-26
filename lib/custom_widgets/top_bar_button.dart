import 'package:flutter/material.dart';

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
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              letterSpacing: 1,
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

    return TextButton(
      child: Text(
        widget.title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width / 15, 0)),
      ),
      // onPressed: () => Navigator.pushReplacement(
      //   context,
      //   PageRouteBuilder(
      //     pageBuilder: builder,
      //     transitionDuration: Duration.zero,
      //   ),
      // ),
      onPressed: widget.onPressed,
    );
  }
}
