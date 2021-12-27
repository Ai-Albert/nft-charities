import 'package:flutter/material.dart';

class TopNavButton extends StatelessWidget {
  const TopNavButton({Key? key, required this.title, required this.builder}) : super(key: key);

  final String title;
  final Widget Function(BuildContext, Animation, Animation) builder;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: () => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: builder,
          transitionDuration: Duration.zero,
        ),
      ),
    );
  }
}
