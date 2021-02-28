import 'package:dart_counter/assets/app_colors.dart';
import 'package:flutter/cupertino.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  PrimaryButton({
    this.text,
    this.onPressed
  }) : assert(text!= null && text.length > 0);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: AppColors.black,
      padding: EdgeInsets.all(0.0),
      onPressed: onPressed,
      child: SizedBox(width: double.infinity, child: Center(child: Text(text))),
    );
  }
}
