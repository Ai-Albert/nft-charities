import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({Key? key, required this.label, required this.onPressed}) : super(key: key);

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: SizedBox(
        width: 225,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        side: MaterialStateProperty.all(BorderSide(color: Colors.yellow[800]!, width: 4)),
      ),
      onPressed: onPressed,
    );
  }
}
