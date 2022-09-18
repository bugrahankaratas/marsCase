// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MenuViewModel on _MenuViewModelBase, Store {
  late final _$listAtom =
      Atom(name: '_MenuViewModelBase.list', context: context);

  @override
  List<Notes>? get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<Notes>? value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$fethNoteListAsyncAction =
      AsyncAction('_MenuViewModelBase.fethNoteList', context: context);

  @override
  Future<void> fethNoteList() {
    return _$fethNoteListAsyncAction.run(() => super.fethNoteList());
  }

  late final _$deleteNotesAsyncAction =
      AsyncAction('_MenuViewModelBase.deleteNotes', context: context);

  @override
  Future<dynamic> deleteNotes(BuildContext context, int index) {
    return _$deleteNotesAsyncAction
        .run(() => super.deleteNotes(context, index));
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
