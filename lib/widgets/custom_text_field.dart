import 'package:demokart/utils/themes/colors.dart';
import 'package:demokart/utils/themes/text_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hintText,
    required this.validator,
    this.inputType = TextInputType.name,
    Key? key,
  }) : super(key: key);
  final String hintText;
  final String? Function(String?) validator;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: inputType,
        validator: validator,
        cursorColor: ACCENT_COLOR_DARK,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          labelStyle: TEXT_HEADING_STYLE.copyWith(
              color: ACCENT_COLOR_LIGHT.withOpacity(0.8), fontSize: 12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ACCENT_COLOR_LIGHT),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ACCENT_COLOR_DARK),
          ),
          labelText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ACCENT_COLOR_DARK),
          ),
        ),
      ),
    );
  }
}
