import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:kartal/kartal.dart';
import 'package:mars_case/utils/theme/colors.dart';

import '../../../core/constant/text_constant.dart';
import '../../../core/helper/statefull_wrapper.dart';
import '../../../service/service.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_textfield.dart';
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
          backgroundColor: AppColors.appColor.brown200,
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
        Text(Constants.get.textConstant.password,
            style: context.textTheme.headline2?.copyWith(fontSize: 25, color: Colors.white)),
        _fixSizedBox(context),
        CustomTextField(
            obscureText: true,
            controller: _viewModel.passwordController,
            hintText: Constants.get.textConstant.password),
        _fixSizedBox(context),
        _loginButton(context),
      ],
    );
  }

  SizedBox _fixSizedBox(BuildContext context) => SizedBox(height: context.dynamicHeight(0.05));

  CustomElevatedButton _loginButton(BuildContext context) {
    return CustomElevatedButton(
        text: Constants.get.textConstant.login,
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
