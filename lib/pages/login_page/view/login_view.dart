import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_case/helper/statefull_wrapper.dart';
import 'package:mars_case/pages/login_page/viewmodel/login_viewmodel.dart';
import 'package:mars_case/widgets/custom_container.dart';
import 'package:mars_case/widgets/custom_elevated_button.dart';
import 'package:mars_case/widgets/custom_textfield.dart';

import '../../../widgets/custom_appbar.dart';
import '../../register_page/view/register_view.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final _viewModel = LoginViewModel();

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
          appBar: CustomAppBar(title: 'Login'),
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
        CustomTextField(controller: _viewModel.passwordController, hintText: 'Password'),
        _fixSizedBox(context),
        _loginButton(),
        _fixSizedBox(context),
        _signInButton(context),
      ]),
    );
  }

  SizedBox _fixSizedBox(BuildContext context) => SizedBox(height: context.dynamicHeight(0.03));

  CustomElevatedButton _loginButton() {
    return CustomElevatedButton(
        text: 'Login',
        height: 40,
        width: 80,
        onTap: () {
          _viewModel.allListener();
          _viewModel.fillBlanks();
        },
        mainAxisAlignment: MainAxisAlignment.center);
  }

  CustomElevatedButton _signInButton(BuildContext context) {
    return CustomElevatedButton(
        text: 'Sign in',
        height: 40,
        width: 300,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterView()));
        },
        mainAxisAlignment: MainAxisAlignment.center);
  }
}
