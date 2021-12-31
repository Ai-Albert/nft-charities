import 'package:flutter/material.dart';

class TopBarButton extends StatelessWidget {
  const TopBarButton({Key? key, required this.title, required this.builder}) : super(key: key);

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
        minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width / 15, 0)),
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
