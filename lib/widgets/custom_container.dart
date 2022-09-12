import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key, required this.children, this.crossAxisAlignment, this.mainAxisAlignment})
      : super(key: key);
  final List<Widget> children;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.4),
      width: context.dynamicWidth(0.8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.brown,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 20,
            blurRadius: 20,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.end,
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
            children: children),
      ),
    );
  }
}
