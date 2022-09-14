import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Widget? widget;
  final List<Widget>? actions;
  final String title;
  final Widget? leading;
  CustomAppBar({Key? key, this.actions, this.widget, required this.title, this.leading})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      actions: actions,
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: context.textTheme.headline2?.copyWith(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
