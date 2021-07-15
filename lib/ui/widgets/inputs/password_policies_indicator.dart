import 'package:flutter/material.dart';
import 'package:revvy/ui/widgets/inputs/password_validator.dart';
import 'package:flutter_svg/svg.dart';

class PasswordPoliciesIndicator extends StatelessWidget {
  final PasswordValidator passwordFormZInput;
  final fontSize = 14.0;
  final horizontalMargin = 8.0;

  PasswordPoliciesIndicator({
    required this.passwordFormZInput,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            passwordFormZInput.isLengthValid(passwordFormZInput.value)
                ? SvgPicture.asset(
                    'assets/icons/rounded_check_active.svg',
                  )
                : SvgPicture.asset(
                    'assets/icons/rounded_check_inactive.svg',
                  ),
            SizedBox(
              width: horizontalMargin,
            ),
            Text(
              'At least 6 characters',
              style: TextStyle(
                fontSize: fontSize,
              ),
            )
          ],
        ),
        SizedBox(
          height: horizontalMargin,
        ),
        Row(
          children: <Widget>[
            passwordFormZInput
                    .isMustIncludeADigitValid(passwordFormZInput.value)
                ? SvgPicture.asset(
                    'assets/icons/rounded_check_active.svg',
                  )
                : SvgPicture.asset(
                    'assets/icons/rounded_check_inactive.svg',
                  ),
            SizedBox(
              width: horizontalMargin,
            ),
            Text(
              'At least 1 number',
              style: TextStyle(
                fontSize: fontSize,
              ),
            )
          ],
        ),
        SizedBox(
          height: horizontalMargin,
        ),
        Row(
          children: <Widget>[
            passwordFormZInput
                    .isUpperAndLowerCaseValid(passwordFormZInput.value)
                ? SvgPicture.asset(
                    'assets/icons/rounded_check_active.svg',
                  )
                : SvgPicture.asset(
                    'assets/icons/rounded_check_inactive.svg',
                  ),
            SizedBox(
              width: horizontalMargin,
            ),
            Text(
              'At least 1 upper and lower case letter',
              style: TextStyle(
                fontSize: fontSize,
              ),
            )
          ],
        ),
      ],
    );
    ;
  }
}
