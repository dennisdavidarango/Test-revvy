import 'package:flutter/material.dart';

import '../../../widgets/screen/app_appbar_screen.dart';

class SignUpAppBarHighOrderScreen extends StatelessWidget {
  const SignUpAppBarHighOrderScreen({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return AppAppBarScreen(
      widget: widget,
    );
  }
}
