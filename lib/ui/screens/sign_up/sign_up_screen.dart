import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:revvy/ui/constants/AppFonts.dart';
import 'package:revvy/ui/widgets/texts/headline_widget.dart';

import '../../constants/AppColors.dart';
import '../../widgets/buttons/button_accent.dart';
import '../../widgets/buttons/button_primary.dart';
import '../../widgets/inputs/email_input.dart';
import '../../widgets/inputs/email_validator.dart';
import '../../widgets/inputs/top_labeled_input.dart';
import '../../widgets/platform/platform_scaffold.dart';
import 'password_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const String Route = '/sign_up/sign_up_screen';
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  EmailValidator _emailValidator = EmailValidator.pure(
    isRequired: true,
  );
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Scaffold(
        body: ListView(children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                      height: 100,
                      alignment: Alignment.center,
                      child: Headline(title: 'Sing Up for Revvy', signs: '.')),
                ),
                SizedBox(
                  height: 30,
                ),
                _topLabeledInput(),
                SizedBox(
                  height: 50,
                ),
                _ButtonAccent(),
                SizedBox(
                  height: 50,
                ),
                _ButtonPrimary(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'By signing up, you agree to Revvy’s ',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 12,
                        color: AppColors.PRIMARY_SWATCH[200],
                        fontFamily: AppFonts.Avenir,
                      ),
                ),
                Text(
                  'Terms of use & Privacy Policy',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 12,
                        color: AppColors.PRIMARY_SWATCH[0],
                        fontFamily: AppFonts.Avenir,
                      ),
                ),
                SizedBox(
                  height: 30,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Already a member?',
                    style: Theme.of(context).textTheme.bodyText1,
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Log in',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontFamily: AppFonts.Avenir,
                              color: AppColors.ORANGE,
                            ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  TopLabeledInput _topLabeledInput() {
    return TopLabeledInput(
      label: 'Email',
      widget: SafeArea(
        child: EmailInput(
          emailValidator: _emailValidator,
          onChanged: (String value) {
            setState(() {
              _emailValidator = EmailValidator.dirty(
                value: value,
              );
            });
          },
        ),
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
          child: Text(
            messages!.sign_up_get_started,
            style: TextStyle(
              fontFamily: AppFonts.SFProText,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(PasswordScreen.Route);
          },
        ),
      ],
    );
  }
}

class _ButtonPrimary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ButtonPrimary(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.ac_unit_rounded),
              SizedBox(
                width: 20,
              ),
              Text('Continue with Apple'),
            ],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(
          height: 10,
        ),
        ButtonPrimary(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.ac_unit_rounded),
              SizedBox(
                width: 10,
              ),
              Text('Continue with Google'),
            ],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(
          height: 10,
        ),
        ButtonPrimary(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.ac_unit_rounded),
              SizedBox(
                width: 10,
              ),
              Text('Continue with Twitter'),
            ],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
