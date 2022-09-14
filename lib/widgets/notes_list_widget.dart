import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key, required this.onTap}) : super(key: key);
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: ListTile(
          tileColor: Colors.brown[100],
          leading: Container(
            color: Colors.black,
            height: context.dynamicHeight(0.2),
            width: context.dynamicWidth(0.2),
          ),
          title: const Text('başlık'),
          subtitle: const Text(
              'açıklamaaçıklamaaçıklamaaçıklamaaçıklamaaçıklamaaçıklamaaçıklamaaçıklamaaçıklamaaçıklamaaçıklamaaçıklama'),
          trailing: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
