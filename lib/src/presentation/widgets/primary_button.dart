import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    required this.buttonColor,
    required this.textButtonColor,
  });

  final bool isEnabled;
  final String text;
  final VoidCallback? onPressed;
  final Color buttonColor;
  final Color textButtonColor;

  static const minHeight = 48.0;

  static const double defaultSpacing = 14.0;
  static const paddingAroundButton = EdgeInsets.symmetric(vertical: 8);
  static const shapeButton = RoundedRectangleBorder(borderRadius:  BorderRadius.all(Radius.circular(48)));

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: minHeight,
        minWidth: MediaQuery.of(context).size.width,
      ),
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shadowColor: Theme.of(context).primaryColor,
          shape: shapeButton,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: defaultSpacing,
            color: isEnabled
                ? Theme.of(context).secondaryHeaderColor
                : Theme.of(context).disabledColor,
          ),
        ),
      ),
    );
  }
}
