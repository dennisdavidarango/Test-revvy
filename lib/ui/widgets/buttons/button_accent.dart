import 'package:flutter/material.dart';
import 'package:revvy/ui/constants/AppColors.dart';
import 'package:revvy/ui/constants/AppSizes.dart';

class ButtonAccent extends StatelessWidget {
  ButtonAccent({
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
        primary: theme.accentColor,
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.BUTTON_PADDING_VERTICAL,
        ),
        onPrimary: Color(AppColors.BUTTON_ACCENT_TEXT),
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: AppSizes.BUTTON_FONT,
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
