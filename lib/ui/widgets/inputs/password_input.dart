import 'package:flutter/material.dart';
import 'package:revvy/ui/widgets/inputs/password_validator.dart';

import 'text_editing_controller_with_cursor_position.dart';

class PasswordInput extends StatefulWidget {
  PasswordInput({
    required this.passwordValidator,
    required this.onChanged,
    this.autofillHints,
    this.label,
    required this.validationErrorMsg,
    required this.textInputType,
  });

  final PasswordValidator passwordValidator;
  final Function(String newValue) onChanged;
  final Iterable<String>? autofillHints;
  final String? label;
  final String validationErrorMsg;
  final TextInputType textInputType;

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  final _inputController = TextEditingControllerWithCursorPosition();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    _inputController.text = widget.passwordValidator.value;
    return TextFormField(
      controller: _inputController,
      obscureText: !_showPassword,
      autofillHints: [AutofillHints.email],
      onChanged: (value) {
        widget.onChanged(value);
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: widget.label,
        errorText: widget.passwordValidator.invalid
            ? PasswordValidator
                .errorsMessagesMap[widget.passwordValidator.error]
            : null,
      ),
    );
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }
}
