import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../service/service.dart';
part 'edit_notes_viewmodel.g.dart';

class EditNotesViewModel = _EditNotesViewModelBase with _$EditNotesViewModel;

abstract class _EditNotesViewModelBase with Store {
  @observable
  TextEditingController titleController = TextEditingController(text: '');
  @observable
  TextEditingController descriptionController = TextEditingController(text: '');

  final _service = Service();

  @action
  titleControllerListener() {
    titleController = titleController;
  }

  @action
  descriptionControllerListener() {
    descriptionController = descriptionController;
  }

  update(index) async {
    await _service.updateDocument(index, titleController.text, descriptionController.text);
  }
}
