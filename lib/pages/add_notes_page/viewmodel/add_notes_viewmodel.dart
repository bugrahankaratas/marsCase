import 'package:flutter/material.dart';
import 'package:mars_case/service/model/user_model.dart';
import 'package:mars_case/service/service.dart';
import 'package:mobx/mobx.dart';

import '../../../core/constant/navigation_constant.dart';
import '../../../core/constant/text_constant.dart';
import '../../../core/helper/snackbar.dart';
import '../../../utils/navigation_manager/navigation_manager.dart';
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

  @action
  fillFields(Notes? note) async {
    titleController.text = note?.title ?? '';
    descriptionController.text = note?.content ?? '';
  }

  add() async {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
      ShowSnackBar.showErrorSnackBar(_context, 'Tüm Boşlukları doldurunuz.');
    } else if (titleController.text.length <= 2) {
      ShowSnackBar.showErrorSnackBar(_context, Constants.get.textConstant.title3Letters);
    } else if (descriptionController.text.length <= 9) {
      ShowSnackBar.showErrorSnackBar(_context, Constants.get.textConstant.desc10Letters);
    } else {
      await Service.instance.addDocument(titleController.text, descriptionController.text);
      ShowSnackBar.showSuccessSnackBar(_context, Constants.get.textConstant.savedNotes);

      await NavigationManager.instance.navigateToPageClear(path: NavConstant.menuView);
    }
  }

  update(index) async {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
      ShowSnackBar.showErrorSnackBar(_context, 'Tüm Boşlukları doldurunuz.');
    } else if (titleController.text.length <= 2) {
      ShowSnackBar.showErrorSnackBar(_context, Constants.get.textConstant.title3Letters);
    } else if (descriptionController.text.length <= 9) {
      ShowSnackBar.showErrorSnackBar(_context, Constants.get.textConstant.desc10Letters);
    } else {
      await Service.instance.updateDocument(index, titleController.text, descriptionController.text);
      ShowSnackBar.showSuccessSnackBar(_context, Constants.get.textConstant.savedNotes);

      await NavigationManager.instance.navigateToPageClear(path: NavConstant.menuView);
    }
  }
}
