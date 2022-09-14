// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_notes_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditNotesViewModel on _EditNotesViewModelBase, Store {
  late final _$titleControllerAtom =
      Atom(name: '_EditNotesViewModelBase.titleController', context: context);

  @override
  TextEditingController get titleController {
    _$titleControllerAtom.reportRead();
    return super.titleController;
  }

  @override
  set titleController(TextEditingController value) {
    _$titleControllerAtom.reportWrite(value, super.titleController, () {
      super.titleController = value;
    });
  }

  late final _$descriptionControllerAtom = Atom(
      name: '_EditNotesViewModelBase.descriptionController', context: context);

  @override
  TextEditingController get descriptionController {
    _$descriptionControllerAtom.reportRead();
    return super.descriptionController;
  }

  @override
  set descriptionController(TextEditingController value) {
    _$descriptionControllerAtom.reportWrite(value, super.descriptionController,
        () {
      super.descriptionController = value;
    });
  }

  late final _$_EditNotesViewModelBaseActionController =
      ActionController(name: '_EditNotesViewModelBase', context: context);

  @override
  dynamic titleControllerListener() {
    final _$actionInfo = _$_EditNotesViewModelBaseActionController.startAction(
        name: '_EditNotesViewModelBase.titleControllerListener');
    try {
      return super.titleControllerListener();
    } finally {
      _$_EditNotesViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic descriptionControllerListener() {
    final _$actionInfo = _$_EditNotesViewModelBaseActionController.startAction(
        name: '_EditNotesViewModelBase.descriptionControllerListener');
    try {
      return super.descriptionControllerListener();
    } finally {
      _$_EditNotesViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titleController: ${titleController},
descriptionController: ${descriptionController}
    ''';
  }
}
