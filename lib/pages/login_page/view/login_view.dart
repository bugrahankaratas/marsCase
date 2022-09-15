import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_case/helper/statefull_wrapper.dart';
import 'package:mars_case/pages/login_page/viewmodel/login_viewmodel.dart';
import 'package:mars_case/pages/register_page/view/register_view.dart';
import 'package:mars_case/service/service.dart';
import 'package:mars_case/widgets/custom_container.dart';
import 'package:mars_case/widgets/custom_elevated_button.dart';
import 'package:mars_case/widgets/custom_textfield.dart';

import '../../../widgets/custom_appbar.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final _viewModel = LoginViewModel();
  String pass = '';

  Future<void> init(BuildContext context) async {
    await Future.microtask(() {
      _viewModel.setContext(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {
        init(context);
      },
      child: Observer(builder: (_) {
        return Scaffold(
          appBar: CustomAppBar(title: 'Üye Giriş'),
          body: _body(context),
        );
      }),
    );
  }

  Center _body(BuildContext context) {
    return Center(
      child: CustomContainer(children: [
        CustomTextField(controller: _viewModel.emailController, hintText: 'E-Mail'),
        _fixSizedBox(context),
        CustomTextField(obscureText: true, controller: _viewModel.passwordController, hintText: 'Şifrenizi giriniz'),
        _fixSizedBox(context),
        _loginButton(context),
        _fixSizedBox(context),
        _signInButton(context),
      ]),
    );
  }

  SizedBox _fixSizedBox(BuildContext context) => SizedBox(height: context.dynamicHeight(0.03));

  CustomElevatedButton _loginButton(BuildContext context) {
    return CustomElevatedButton(
        text: 'Giriş',
        height: 40,
        width: 80,
        onTap: () {
          _viewModel.allListener();
          _viewModel.fillBlanks();
          log(Service.instance.userMail());
        },
        mainAxisAlignment: MainAxisAlignment.center);
  }

  CustomElevatedButton _signInButton(BuildContext context) {
    return CustomElevatedButton(
        text: 'Kayıt Ol',
        height: 40,
        width: 300,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterView()));
        },
        mainAxisAlignment: MainAxisAlignment.center);
  }
}
