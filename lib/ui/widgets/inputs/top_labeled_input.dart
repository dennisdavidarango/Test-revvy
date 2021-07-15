import 'package:flutter/material.dart';
import 'package:revvy/ui/widgets/platform/platform_scaffold.dart';

class TopLabeledInput extends StatelessWidget {
  const TopLabeledInput({
    Key? key,
    required this.label,
    required this.widget,
  }) : super(key: key);

  final String label;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(
            height: 7,
          ),
          widget,
        ],
      ),
    );
  }
}
