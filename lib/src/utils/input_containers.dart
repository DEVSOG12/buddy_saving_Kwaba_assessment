import 'package:flutter/material.dart';

Widget inputContainer(
    {Icon? icon,
    BuildContext? context,
    TextEditingController? controller,
    Function()? onTapOnIcon,
    Widget? prefix}) {
  return SizedBox(
    height: 50,
    width: MediaQuery.of(context!).size.width * 0.8,
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefix: prefix,
        suffixIcon: onTapOnIcon != null
            ? IconButton(
                onPressed: onTapOnIcon,
                icon: icon!,
              )
            : null,
        // icon: icon,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color:
                  controller!.text.isNotEmpty ? Colors.greenAccent : Colors.red,
              width: 1.0),
        ),
      ),
    ),
  );
}
