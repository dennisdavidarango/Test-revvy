import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revvy/ui/widgets/platform/platform_appbar.dart';
import 'package:revvy/ui/widgets/platform/platform_leading.dart';
import 'package:revvy/ui/widgets/platform/platform_scaffold.dart';

import '../../constants/AppSizes.dart';

class AppAppBarScreen extends StatelessWidget {
  const AppAppBarScreen({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      platformAppBar: PlatformAppBar(),
      body: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: AppSizes.SCREEN_PADDING_HORIZONTAL,
              right: AppSizes.SCREEN_PADDING_HORIZONTAL,
              bottom: AppSizes.SCREEN_PADDING_BOTTOM,
            ),
            child: widget,
          ),
        ),
      ),
    );
  }
}
