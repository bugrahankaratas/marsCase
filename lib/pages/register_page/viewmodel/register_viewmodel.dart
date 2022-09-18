import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

import '../../../core/constant/text_constant.dart';
import '../../../core/helper/loading_manager/loading_manager.dart';
import '../../../core/helper/snackbar.dart';
import '../../../service/firebase_auth.dart';
import '../../../service/service.dart';
import '../../menu_page/view/menu_view.dart';

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

  @action
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

  Future succesAndNavigate() async {
    ShowSnackBar.showSuccessSnackBar(_context, Constants.get.textConstant.succes);
    await Navigator.of(_context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => MenuView()),
      (route) => false,
    );
  }

  createUser() async {
    if (emailController.text.isEmpty || passwordCheckController.text.isEmpty || passwordController.text.isEmpty) {
      ShowSnackBar.showErrorSnackBar(_context, Constants.get.textConstant.allEmpty);
    } else if (passwordCheckController.text != passwordController.text) {
      ShowSnackBar.showErrorSnackBar(_context, Constants.get.textConstant.dontMatch);
    } else {
      await LoadingManager.instance.showLoading(_context);

      await _auth.createUser(emailController.text, passwordController.text, _context);
      await LoadingManager.instance.hideLoading(_context);

      Service.instance.userId().isNotEmpty ? await succesAndNavigate() : null;
    }
  }
}
