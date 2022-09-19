import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:kartal/kartal.dart';
import 'package:mars_case/core/constant/text_constant.dart';

import '../../../core/constant/navigation_constant.dart';
import '../../../core/helper/statefull_wrapper.dart';
import '../../../service/model/user_model.dart';
import '../../../utils/navigation_manager/navigation_manager.dart';
import '../../../widgets/custom_appbar.dart';
import '../../add_notes_page/view/add_notes_view.dart';
import '../viewmodel/menu_view_model.dart';

class MenuView extends StatelessWidget {
  MenuView({Key? key}) : super(key: key);
  final MenuViewModel _viewModel = MenuViewModel();

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {
        _viewModel.fethNoteList();
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.brown[400],
          onPressed: () async {
            // await FirebaseAuth.instance.signOut();
            NavigationManager.instance.navigateToPage(path: NavConstant.addNotesView);
          },
          child: const Icon(Icons.add),
        ),
        appBar: _customappbar(context),
        body: Observer(builder: (_) {
          return ListView.builder(
              itemCount: _viewModel.list?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final note = _viewModel.list?[index];

                return Dismissible(
                  key: Key(index.toString()),
                  onDismissed: (DismissDirection dissmissDirection) async {
                    _viewModel.deleteNotes(context, index);
                  },
                  child: _inkwellCard(context, index, note),
                );
              });
        }),
      ),
    );
  }

  CustomAppBar _customappbar(BuildContext context) {
    return CustomAppBar(
      title: Constants.get.textConstant.menuPage,
      actions: [
        IconButton(
            onPressed: () {
              NavigationManager.instance.navigateToPage(path: NavConstant.settingsView);
            },
            icon: const Icon(Icons.settings))
      ],
    );
  }

  InkWell _inkwellCard(BuildContext context, int index, Notes? note) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddNotesView(index: index, note: _viewModel.list?[index])));
      },
      child: Card(
        child: ListTile(
          tileColor: Colors.brown[100],
          leading: Container(
            color: Colors.black,
            height: context.dynamicHeight(0.2),
            width: context.dynamicWidth(0.2),
          ),
          title: Text(
            note?.title ?? '',
            style: const TextStyle(fontSize: 18),
          ),
          subtitle: Text(
            note?.content ?? '',
            style: const TextStyle(fontSize: 16),
          ),
          trailing: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
