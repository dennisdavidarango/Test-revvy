import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_appbar.dart';
import 'platform_widget.dart';

class PlatformScaffold extends PlatformWidget {
  PlatformScaffold({
    this.platformAppBar,
    required this.body,
  });

  final PlatformAppBar? platformAppBar;
  final Widget body;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    var localAppBar = platformAppBar;

    if (localAppBar == null) {
      return CupertinoPageScaffold(
        child: body,
      );
    }

    return CupertinoPageScaffold(
      navigationBar: localAppBar.buildCupertinoWidget(context),
      child: body,
    );

    //it works
    // return CupertinoPageScaffold(
    //   navigationBar: CupertinoNavigationBar(
    //     leading: CupertinoNavigationBarBackButton(
    //       previousPageTitle: 'Back 4',
    //     ),
    //     backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    //     trailing: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //     ),
    //   ),
    //   child: body,
    // );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    var localAppBar = platformAppBar;

    if (localAppBar == null) {
      return Scaffold(
        body: body,
      );
    }

    return Scaffold(
      appBar: localAppBar.buildMaterialWidget(context),
      body: body,
    );
  }
}
