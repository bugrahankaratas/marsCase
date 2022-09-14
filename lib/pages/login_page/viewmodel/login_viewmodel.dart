import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mars_case/service/firebase_auth.dart';
import 'package:mobx/mobx.dart';

import '../../../helper/snackbar.dart';
import '../../menu_page/view/menu_view.dart';
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

  succesAndNavigate() {
    ShowSnackBar.showSuccessSnackBar(_context, 'Giriş Başarılı');
    Navigator.of(_context).push(MaterialPageRoute(builder: (context) => MenuView()));
  }

  fillBlanks() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ShowSnackBar.showErrorSnackBar(_context, 'Lütfen tüm boşlukları doldurunuz.');
    } else {
      final user = await _auth.signIn(emailController.text, passwordController.text, _context);

      user?.uid.isEmpty ?? true ? log('message') : await succesAndNavigate();
    }
  }
}
