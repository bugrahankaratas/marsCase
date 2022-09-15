import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mars_case/helper/statefull_wrapper.dart';
import 'package:mars_case/widgets/custom_container.dart';
import 'package:mars_case/widgets/custom_elevated_button.dart';
import 'package:mars_case/widgets/custom_textfield.dart';

import 'package:kartal/kartal.dart';

import '../../../service/service.dart';
import '../viewmodel/password_viewmodel.dart';

class PasswordView extends StatelessWidget {
  PasswordView({
    Key? key,
  }) : super(key: key);

  final _viewModel = PasswordViewModel();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return StatefulWrapper(
        onInit: () {
          _viewModel.setContext(context);
        },
        child: Scaffold(
          backgroundColor: Colors.brown[100],
          body: Center(
            child: _customContainer(context),
          ),
        ),
      );
    });
  }

  CustomContainer _customContainer(BuildContext context) {
    return CustomContainer(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _fixSizedBox(context),
        Text('Lütfen Şifrenizi Giriniz',
            style: context.textTheme.headline2?.copyWith(fontSize: 25, color: Colors.white)),
        _fixSizedBox(context),
        CustomTextField(obscureText: true, controller: _viewModel.passwordController, hintText: 'Şifre'),
        _fixSizedBox(context),
        _loginButton(context),
      ],
    );
  }

  SizedBox _fixSizedBox(BuildContext context) => SizedBox(height: context.dynamicHeight(0.05));

  CustomElevatedButton _loginButton(BuildContext context) {
    return CustomElevatedButton(
        text: 'Login',
        height: context.dynamicHeight(0.05),
        width: context.dynamicWidth(0.7),
        onTap: () {
          _viewModel.passwordControllerListener();
          _viewModel.fillBlanks();
          log(Service.instance.userMail());
        },
        mainAxisAlignment: MainAxisAlignment.center);
  }
}
