import 'package:flutter/material.dart';
import 'package:mars_case/helper/loading_manager/loading_manager.dart';
import 'package:mars_case/helper/snackbar.dart';
import 'package:mars_case/pages/menu_page/view/menu_view.dart';
import 'package:mars_case/service/firebase_auth.dart';
import 'package:mars_case/service/service.dart';
import 'package:mobx/mobx.dart';

part 'register_viewmodel.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store {
  late BuildContext _context;
  final _auth = FBAuth();

  @observable
  TextEditingController emailController = TextEditingController(text: '');
  @observable
  TextEditingController passwordController = TextEditingController(text: '');
  @observable
  TextEditingController passwordCheckController = TextEditingController(text: '');

  Future<void> setContext(BuildContext context) async {
    _context = context;
  }

  allListeners() {
    emailControllerListener();
    passwordControllerListener();
    passwordCheckControllerListener();
  }

  @action
  emailControllerListener() {
    emailController = emailController;
  }

  @action
  passwordControllerListener() {
    passwordController = passwordController;
  }

  @action
  passwordCheckControllerListener() {
    passwordCheckController = passwordCheckController;
  }

  succesAndNavigate() async {
    ShowSnackBar.showSuccessSnackBar(_context, 'Kayıt Başarılı');
    await LoadingManager.instance.showLoading(_context);

    await Navigator.of(_context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => MenuView()),
      (route) => false,
    );

    await LoadingManager.instance.hideLoading(_context);
  }

  createUser() async {
    if (emailController.text.isEmpty || passwordCheckController.text.isEmpty || passwordController.text.isEmpty) {
      ShowSnackBar.showErrorSnackBar(_context, 'Lütfen tüm boşlukları doldurunuz.');
    } else if (passwordCheckController.text != passwordController.text) {
      ShowSnackBar.showErrorSnackBar(_context, 'Şifreler Eşleştirilemiyor.');
    } else {
      await _auth.createUser(emailController.text, passwordController.text, _context);
      Service.instance.userId().isNotEmpty ? succesAndNavigate() : null;
    }
  }
}
