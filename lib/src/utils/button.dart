import 'package:flutter/material.dart';

Widget button({double? width, String? text, Function()? onpressed}) {
  return MaterialButton(
    onPressed: onpressed,
    minWidth: width,
    height: 50,
    textColor: Colors.white,
    color: const Color.fromARGB(255, 55, 51, 144),
    child: Text(text!),
  );
}
