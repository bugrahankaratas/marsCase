// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PasswordViewModel on _PasswordViewModelBase, Store {
  late final _$passwordControllerAtom =
      Atom(name: '_PasswordViewModelBase.passwordController', context: context);

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  late final _$setContextAsyncAction =
      AsyncAction('_PasswordViewModelBase.setContext', context: context);

  @override
  Future<void> setContext(BuildContext context) {
    return _$setContextAsyncAction.run(() => super.setContext(context));
  }

  late final _$_PasswordViewModelBaseActionController =
      ActionController(name: '_PasswordViewModelBase', context: context);

  @override
  dynamic passwordControllerListener() {
    final _$actionInfo = _$_PasswordViewModelBaseActionController.startAction(
        name: '_PasswordViewModelBase.passwordControllerListener');
    try {
      return super.passwordControllerListener();
    } finally {
      _$_PasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic succesAndNavigate() {
    final _$actionInfo = _$_PasswordViewModelBaseActionController.startAction(
        name: '_PasswordViewModelBase.succesAndNavigate');
    try {
      return super.succesAndNavigate();
    } finally {
      _$_PasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
passwordController: ${passwordController}
    ''';
  }
}
