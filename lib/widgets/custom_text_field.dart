
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/note_model.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.hint, this.maxLines=1, this.onSaved, this.onChanged, this.initialValue,
  });
  final String hint;
  final int maxLines;
  final String? initialValue;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value){
        if(value?.isEmpty ?? true) {
          return "Field is required";
        }
        else{
          return null;
        }
      },

      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(color: kPrimaryColor),
        focusColor: kPrimaryColor,
      ),
    );
  }
}

OutlineInputBorder buildBorder({color}){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: color ?? Colors.white),
  );
}
