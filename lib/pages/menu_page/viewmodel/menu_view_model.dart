import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../core/helper/loading_manager/loading_manager.dart';
import '../../../service/model/user_model.dart';
import '../../../service/service.dart';
part 'menu_view_model.g.dart';

class MenuViewModel = _MenuViewModelBase with _$MenuViewModel;

abstract class _MenuViewModelBase with Store {
  @observable
  List<Notes>? list = [];

  @action
  Future<void> fethNoteList() async {
    list = await Service.instance.fetchNoteList();
  }

  @action
  Future deleteNotes(BuildContext context, int index) async {
    await LoadingManager.instance.showLoading(context);
    await Service.instance.deleteDocument(index);
    list?.removeAt(index);
    await LoadingManager.instance.hideLoading(context);
  }
}
