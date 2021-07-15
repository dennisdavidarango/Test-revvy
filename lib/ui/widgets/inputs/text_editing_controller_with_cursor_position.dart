import 'package:flutter/material.dart';

//How to keep cursor position
// source : https://github.com/flutter/flutter/issues/11416#issuecomment-719707246
class TextEditingControllerWithCursorPosition extends TextEditingController {
  TextEditingControllerWithCursorPosition({
    String? text,
  }) : super(text: text);

  @override
  set text(String newText) {
    value = value.copyWith(
      text: newText,
      selection: value.selection,
      composing: TextRange.empty,
    );
  }
}
