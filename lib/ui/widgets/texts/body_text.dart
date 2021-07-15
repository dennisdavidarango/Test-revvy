import 'package:flutter/material.dart';

class BodyText1 extends StatelessWidget {
  const BodyText1({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
