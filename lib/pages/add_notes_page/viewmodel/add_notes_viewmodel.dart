import 'package:flutter/material.dart';
import 'package:mars_case/helper/snackbar.dart';
import 'package:mars_case/service/model/user_model.dart';
import 'package:mars_case/service/service.dart';
import 'package:mobx/mobx.dart';

import '../../menu_page/view/menu_view.dart';
part 'add_notes_viewmodel.g.dart';

class AddNotesViewModel = _AddNotesViewModelBase with _$AddNotesViewModel;

abstract class _AddNotesViewModelBase with Store {
  late BuildContext _context;

  @action
  Future<void> setContext(BuildContext context) async {
    _context = context;
  }

  @observable
  TextEditingController titleController = TextEditingController(text: '');
  @observable
  TextEditingController descriptionController = TextEditingController(text: '');

  @action
  titleControllerListener() {
    titleController = titleController;
  }

  @action
  descriptionControllerListener() {
    descriptionController = descriptionController;
  }

  fillFields(Notes? note) async {
    titleController.text = note?.title ?? '';
    descriptionController.text = note?.content ?? '';
  }

  add() async {
    if (titleController.text.length <= 2) {
      ShowSnackBar.showErrorSnackBar(_context, 'Başlık en az 3 harfli olmalıdır.');
    } else if (descriptionController.text.length <= 9) {
      ShowSnackBar.showErrorSnackBar(_context, 'Açıklama en az 10 harfli olmalıdır.');
    } else {
      await Service.instance.addDocument(titleController.text, descriptionController.text);
      ShowSnackBar.showSuccessSnackBar(_context, 'Kayıt Oluşturuldu');

      Navigator.of(_context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MenuView()),
        (route) => false,
      );
    }
  }

  update(index) async {
    if (titleController.text.length <= 2) {
      ShowSnackBar.showErrorSnackBar(_context, 'Başlık en az 3 harfli olmalıdır.');
    } else if (descriptionController.text.length <= 9) {
      ShowSnackBar.showErrorSnackBar(_context, 'Açıklama en az 10 harfli olmalıdır.');
    } else {
      await Service.instance.updateDocument(index, titleController.text, descriptionController.text);
      ShowSnackBar.showSuccessSnackBar(_context, 'Kayıt Güncellendi');

      Navigator.of(_context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MenuView()),
        (route) => false,
      );
    }
  }
}
