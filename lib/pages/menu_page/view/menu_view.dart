import 'package:flutter/material.dart';
import 'package:mars_case/widgets/custom_appbar.dart';

import '../../../widgets/notes_list_widget.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      appBar: CustomAppBar(title: 'Notes'),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return NotesList(onTap: () {});
          }),
    );
  }
}
