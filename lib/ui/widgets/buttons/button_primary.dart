import 'package:flutter/material.dart';

import '../../constants/AppSizes.dart';

class ButtonPrimary extends StatelessWidget {
  ButtonPrimary({
    required this.child,
    this.onPressed,
  });

  final Widget child;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: this.onPressed,
      child: this.child,
      style: ElevatedButton.styleFrom(
        primary: theme.primaryColor,
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.BUTTON_PADDING_VERTICAL,
        ),
        onPrimary: Colors.black,
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: AppSizes.BUTTON_FONT,
          color: Colors.black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppSizes.BUTTON_BORDER_RADIUS,
            ),
          ),
        ),
      ),
    );
  }
}
