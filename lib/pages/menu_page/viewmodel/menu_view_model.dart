import 'package:mobx/mobx.dart';

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
}
