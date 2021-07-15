import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:revvy/ui/constants/AppColors.dart';

import '../../widgets/buttons/button_accent.dart';
import '../../widgets/inputs/password_input.dart';
import '../../widgets/inputs/password_validator.dart';
import '../../widgets/inputs/top_labeled_input.dart';
import 'create_account_name_screen.dart';
import 'home_screen.dart';
import 'widgets/sign_up_appbar_hos.dart';

class PasswordScreen extends StatefulWidget {
  static const String Route = '/sign_up/password_screen';

  const PasswordScreen({Key? key}) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  PasswordValidator _passwordValidator = PasswordValidator.pure(
    isRequired: true,
  );
  @override
  Widget build(BuildContext context) {
    return SignUpAppBarHighOrderScreen(
      widget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              height: 100,
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Welcome to Revvy',
                  style: Theme.of(context).textTheme.headline1,
                  children: <TextSpan>[
                    TextSpan(
                      text: '.',
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                            color: AppColors.ORANGE,
                          ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Create a password.',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AppColors.PRIMARY_SWATCH[200]),
          ),
          _topLabeledInput(),
          SizedBox(
            height: 10,
          ),
          _ButtonAccent()
        ],
      ),
    );
  }

  TopLabeledInput _topLabeledInput() {
    return TopLabeledInput(
      label: 'Password',
      widget: PasswordInput(
        passwordValidator: _passwordValidator,
        onChanged: (String value) {
          setState(() {
            _passwordValidator = PasswordValidator.dirty(
              value: value,
            );
          });
        },
        textInputType: TextInputType.visiblePassword,
        validationErrorMsg: '',
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
            Navigator.of(context).pushNamed(CreateAccountNameScreen.Route);
          },
        ),
      ],
    );
  }
}
