import 'package:flutter/material.dart';
import 'package:revvy/ui/constants/AppFonts.dart';
import '../../constants/AppColors.dart';

class Headline extends StatelessWidget {
  const Headline({
    Key? key,
    required this.title,
    required this.signs,
  }) : super(key: key);

  final String title;
  final String signs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        height: 200,
        alignment: Alignment.center,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: title,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontFamily: AppFonts.Avenir,
                ),
            children: <TextSpan>[
              TextSpan(
                text: signs,
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      color: AppColors.ORANGE,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
