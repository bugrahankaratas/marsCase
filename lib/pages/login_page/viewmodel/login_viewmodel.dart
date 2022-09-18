import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mars_case/pages/menu_page/view/menu_view.dart';
import 'package:mars_case/service/firebase_auth.dart';
import 'package:mobx/mobx.dart';

import '../../../core/constant/text_constant.dart';
import '../../../core/helper/loading_manager/loading_manager.dart';
import '../../../core/helper/snackbar.dart';
part 'login_viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  late BuildContext _context;
  final _auth = FBAuth();

  @observable
  TextEditingController emailController = TextEditingController(text: '');
  @observable
  TextEditingController passwordController = TextEditingController(text: '');

  Future<void> setContext(BuildContext context) async {
    _context = context;
  }

  @action
  allListener() {
    emailControllerListener();
    passwordControllerListener();
  }

  @action
  emailControllerListener() {
    emailController = emailController;
  }

  @action
  passwordControllerListener() {
    passwordController = passwordController;
  }

  Future succesAndNavigate() async {
    ShowSnackBar.showSuccessSnackBar(_context, Constants.get.textConstant.succes);

    await Navigator.of(_context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => MenuView()),
      (route) => false,
    );
  }

  @action
  Future loginButton(BuildContext context) async {
    await LoadingManager.instance.showLoading(context);
    await allListener();
    await fillBlanks();
    await LoadingManager.instance.hideLoading(context);
  }

  Future fillBlanks() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ShowSnackBar.showErrorSnackBar(_context, Constants.get.textConstant.allEmpty);
    } else {
      final user = await _auth.signIn(emailController.text, passwordController.text, _context);

      user?.uid.isEmpty ?? true ? log('message') : await succesAndNavigate();
    }
  }
}
