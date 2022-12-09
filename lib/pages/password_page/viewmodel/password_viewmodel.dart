import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mars_case/core/helper/loading_manager/loading_manager.dart';
import 'package:mars_case/service/service.dart';
import 'package:mobx/mobx.dart';

import '../../../core/constant/navigation_constant.dart';
import '../../../core/constant/text_constant.dart';
import '../../../core/helper/snackbar.dart';
import '../../../service/firebase_auth.dart';
import '../../../utils/navigation_manager/navigation_manager.dart';
part 'password_viewmodel.g.dart';

class PasswordViewModel = _PasswordViewModelBase with _$PasswordViewModel;

abstract class _PasswordViewModelBase with Store {
  late BuildContext _context;
  final _auth = FBAuth();
  String email = Service.instance.userMail();

  @observable
  TextEditingController passwordController = TextEditingController(text: '');

  @action
  Future<void> setContext(BuildContext context) async {
    _context = context;
  }

  @action
  passwordControllerListener() {
    passwordController = passwordController;
  }

  @action
  succesAndNavigate() {
    ShowSnackBar.showSuccessSnackBar(_context, Constants.get.textConstant.succes);
    NavigationManager.instance.navigateToPageClear(path: NavConstant.menuView);
  }

  signOut() async {
    LoadingManager.instance.showLoading(_context);
    ShowSnackBar.showSuccessSnackBar(_context, 'Oturum Başarıyla sonlandırıldı.');
    await _auth.signOut();
    NavigationManager.instance.navigateToPageClear(path: NavConstant.loginView);
  }

  fillBlanks() async {
    if (passwordController.text.isEmpty) {
      ShowSnackBar.showErrorSnackBar(_context, Constants.get.textConstant.allEmpty);
    } else {
      final user = await _auth.signIn(email, passwordController.text, _context);

      user == null ? log('message') : await succesAndNavigate();
    }
  }
}
