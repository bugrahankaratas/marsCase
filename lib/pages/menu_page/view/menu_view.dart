import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mars_case/helper/statefull_wrapper.dart';
import 'package:mars_case/pages/edit_notes_page/view/edit_notes_view.dart';
import 'package:mars_case/pages/menu_page/viewmodel/menu_view_model.dart';
import 'package:mars_case/widgets/custom_appbar.dart';
import 'package:kartal/kartal.dart';

import '../../add_notes_page/view/add_notes_view.dart';

class MenuView extends StatelessWidget {
  MenuView({Key? key}) : super(key: key);
  final MenuViewModel _viewModel = MenuViewModel();

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () async {
        await _viewModel.fethNoteList();
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddNotesView()));
          },
          child: const Icon(Icons.add),
        ),
        appBar: CustomAppBar(title: 'Notes'),
        body: Observer(builder: (_) {
          return ListView.builder(
              itemCount: _viewModel.list?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final note = _viewModel.list?[index];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditNotesView(
                                  index: index,
                                )));
                  },
                  child: Card(
                    child: ListTile(
                      tileColor: Colors.brown[100],
                      leading: Container(
                        color: Colors.black,
                        height: context.dynamicHeight(0.2),
                        width: context.dynamicWidth(0.2),
                      ),
                      title: Text(note?.title ?? ''),
                      subtitle: Text(note?.content ?? ''),
                      trailing: const Icon(Icons.edit),
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }
}
