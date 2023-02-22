import 'package:flutter/material.dart';
import '../../utils/colors.dart';


// Primary outlined button of the application
class PrimaryOutlinedButton extends StatelessWidget {
  PrimaryOutlinedButton({
    super.key,
    required Function() onPressed ,
    String? label,
  }) {
    _onPressed = onPressed;
    _label = label ?? "Click me";
  }

  // click to action of this button
  late final Function() _onPressed;
  // button label
  late final String _label;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _onPressed,
      style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.resolveWith((states) => kDarkColor),
          padding: MaterialStateProperty.resolveWith((states) =>
              const EdgeInsets.symmetric(horizontal: 60, vertical: 10)),
          shape: MaterialStateProperty.resolveWith(
              (states) => RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ))),
      child: Text(
        _label,
        style: const TextStyle(
            fontSize: 36, color: kDarkColor, fontWeight: FontWeight.w400),
      ),
    );
  }
}
