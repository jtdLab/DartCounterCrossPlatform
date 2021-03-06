import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/view/ios/widgets/button/primary_button.dart';
import 'package:flutter/cupertino.dart';

class PrimaryTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final BorderRadius borderRadius;
  final double fontSize;

  PrimaryTextButton(
      {this.text,
      this.onPressed,
      this.borderRadius = const BorderRadius.all(
        Radius.circular(16.0),
      ),
        this.fontSize = 9.0})
      : assert(text != null && text.length > 0);

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: onPressed,
      child: AutoSizeText(
        text,
        maxLines: 1,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
      ),
      borderRadius: borderRadius,
    );
  }
}
