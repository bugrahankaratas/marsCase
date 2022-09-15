import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mars_case/helper/loading_manager/loading_manager.dart';
import 'package:mars_case/helper/statefull_wrapper.dart';
import 'package:mars_case/pages/add_notes_page/view/add_notes_view.dart';
import 'package:mars_case/pages/menu_page/viewmodel/menu_view_model.dart';
import 'package:mars_case/pages/settings_page/view/settings_view.dart';
import 'package:mars_case/service/model/user_model.dart';
import 'package:mars_case/service/service.dart';
import 'package:mars_case/widgets/custom_appbar.dart';
import 'package:kartal/kartal.dart';

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
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNotesView()));
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
                    await LoadingManager.instance.showLoading(context);
                    await Service.instance.deleteDocument(index);
                    await LoadingManager.instance.hideLoading(context);
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
      title: 'Notlarım',
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsView()));
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
