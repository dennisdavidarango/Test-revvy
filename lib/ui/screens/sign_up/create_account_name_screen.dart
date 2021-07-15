import 'package:flutter/material.dart';
import 'package:revvy/ui/constants/AppSizes.dart';
import 'package:revvy/ui/screens/sign_up/profile_picture_screen.dart';
import 'package:revvy/ui/widgets/buttons/button_primary.dart';
import 'package:revvy/ui/widgets/inputs/email_input.dart';
import 'package:revvy/ui/widgets/inputs/email_validator.dart';
import 'package:revvy/ui/widgets/inputs/top_labeled_input.dart';
import 'package:revvy/ui/widgets/platform/platform_scaffold.dart';
import 'package:revvy/ui/widgets/texts/headline_widget.dart';

import '../../constants/AppColors.dart';

class CreateAccountNameScreen extends StatefulWidget {
  static const String Route = '/sign_up/create_account_name_screen';
  const CreateAccountNameScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountNameScreenState createState() =>
      _CreateAccountNameScreenState();
}

class _CreateAccountNameScreenState extends State<CreateAccountNameScreen> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Scaffold(
        body: ListView(children: [
          SafeArea(
            child: Column(
              children: [
                Headline(title: 'Congrats,  Account Created', signs: '!'),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text(
                    'Let\'s get started with your name.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                _inputName(),
                SizedBox(
                  height: 25,
                ),
                _inputLastName(),
                SizedBox(
                  height: 230,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Step 1 of 8",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: AppColors.PRIMARY_SWATCH[200],
                          fontSize: AppSizes.INPUT_TOP_LABEL_TEXT),
                    ),
                    ButtonPrimary(
                      child: Text(
                        'Next >',
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ProfilePictureScreen.Route);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  TopLabeledInput _inputName() {
    return TopLabeledInput(
      label: 'First Name(s)',
      widget: TextFormField(),
    );
  }

  TopLabeledInput _inputLastName() {
    return TopLabeledInput(
      label: 'Last Name(s)',
      widget: TextFormField(),
    );
  }
}
