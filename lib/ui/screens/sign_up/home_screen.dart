import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants/AppColors.dart';
import '../../widgets/buttons/button_accent.dart';
import '../../widgets/inputs/email_input.dart';
import '../../widgets/inputs/email_validator.dart';
import '../../widgets/inputs/top_labeled_input.dart';
import '../../widgets/platform/platform_scaffold.dart';
import 'sign_up_screen.dart';
import 'widgets/sign_up_carousel.dart';

class HomeScreen extends StatefulWidget {
  static const String Route = '/sign_up/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  EmailValidator _emailValidator = EmailValidator.pure(
    isRequired: true,
  );

  @override
  Widget build(BuildContext context) {
    var messages = AppLocalizations.of(context);
    var _verticalMargin = 20.0;

    return PlatformScaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      CarouselWidget(),
                      /*Positioned(
                        top: 300,
                        left: 100,
                        child: _HeadLine1(),
                      ),*/
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              _ButtonAccent()
            ],
          ),
        ],
      ),
    );
  }

  TopLabeledInput _topLabeledInput() {
    return TopLabeledInput(
      label: 'Email',
      widget: EmailInput(
        emailValidator: _emailValidator,
        onChanged: (String value) {
          setState(() {
            _emailValidator = EmailValidator.dirty(
              value: value,
            );
          });
        },
      ),
    );
  }
}

class _ButtonAccent extends StatelessWidget {
  const _ButtonAccent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var messages = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ButtonAccent(
          child: Text(messages!.sign_up_get_started),
          onPressed: () {
            Navigator.of(context).pushNamed(SignUpScreen.Route);
          },
        ),
      ],
    );
  }
}

class _HeadLine1 extends StatelessWidget {
  const _HeadLine1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Head line 2',
        style: Theme.of(context).textTheme.headline1,
        children: <TextSpan>[
          TextSpan(
            text: '?',
            style: Theme.of(context).textTheme.headline1?.copyWith(
                  color: AppColors.ORANGE,
                ),
          )
        ],
      ),
    );
  }
}
