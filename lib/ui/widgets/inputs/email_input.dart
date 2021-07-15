import 'package:flutter/material.dart';

import '../../constants/AppColors.dart';
import 'email_validator.dart';
import 'text_editing_controller_with_cursor_position.dart';

class EmailInput extends StatefulWidget {
  EmailInput({
    required this.emailValidator,
    required this.onChanged,
    this.autofillHints,
    this.label,
  });

  final EmailValidator emailValidator;
  final Function(String newValue) onChanged;
  final Iterable<String>? autofillHints;
  final String? label;

  @override
  _EmailInputState createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  final _inputController = TextEditingControllerWithCursorPosition();

  @override
  Widget build(BuildContext context) {
    _inputController.text = widget.emailValidator.value;
    return TextFormField(
      controller: _inputController,
      autofillHints: [AutofillHints.email],
      onChanged: (value) {
        widget.onChanged(value);
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: widget.label,
        errorText: widget.emailValidator.invalid
            ? EmailValidator.errorsMessagesMap[widget.emailValidator.error]
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
