import 'package:flutter/material.dart';
import 'package:mars_case/service/service.dart';
import 'package:mobx/mobx.dart';
part 'add_notes_viewmodel.g.dart';

class AddNotesViewModel = _AddNotesViewModelBase with _$AddNotesViewModel;

abstract class _AddNotesViewModelBase with Store {
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

  add() async {
    await _service.addDocument(titleController.text, descriptionController.text);
  }
}
