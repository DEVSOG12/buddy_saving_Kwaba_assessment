import 'package:flutter/material.dart';

Widget myRadioButton({String? title, int? value, onChanged, int? groupValue}) {
  return SizedBox(
    height: 40,
    child: RadioListTile(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      title: Text(title!),
    ),
  );
}
