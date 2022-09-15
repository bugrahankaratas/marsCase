import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.expands,
      this.textAlign,
      this.prefixIcon,
      this.border,
      this.maxLines,
      this.obscureText})
      : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final bool? expands;
  final TextAlign? textAlign;
  final Widget? prefixIcon;
  final InputBorder? border;
  final int? maxLines;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: obscureText ?? false,
        maxLines: maxLines ?? 1,
        textAlign: textAlign ?? TextAlign.start,
        // expands: expands ?? false,
        controller: controller,
        style: context.textTheme.headline2?.copyWith(fontSize: 20, color: Colors.white),
        cursorColor: Colors.white,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: prefixIcon ??
              const Icon(
                Icons.person,
                color: Colors.white,
              ),
          hintText: hintText,
          prefixText: '',
          hintStyle: const TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder: border ??
              const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
          enabledBorder: border ??
              const UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.white,
              )),
        ));
  }
}
