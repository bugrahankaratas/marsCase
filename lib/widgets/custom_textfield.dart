import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.controller, required this.hintText}) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        style: const TextStyle(
          color: Colors.white,
        ),
        cursorColor: Colors.white,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          hintText: hintText,
          prefixText: ' ',
          hintStyle: const TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
        ));
  }
}
