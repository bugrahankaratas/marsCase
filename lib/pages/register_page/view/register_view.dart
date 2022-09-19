import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_case/core/constant/text_constant.dart';

import '../../../core/helper/statefull_wrapper.dart';
import '../../../service/firebase_auth.dart';
import '../../../utils/navigation_manager/navigation_manager.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_textfield.dart';
import '../viewmodel/register_viewmodel.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  final _viewModel = RegisterViewModel();
  final _auth = FBAuth();

  Future<void> init(BuildContext context) async {
    await Future.microtask(() {
      _viewModel.setContext(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(onInit: () {
      init(context);
    }, child: Observer(builder: (_) {
      return Scaffold(
        appBar: CustomAppBar(
            title: Constants.get.textConstant.registerPage,
            leading: IconButton(
              onPressed: () {
                NavigationManager.instance.navigatePop();
              },
              icon: const Icon(Icons.chevron_left, color: Colors.white),
            )),
        body: Center(
            child: CustomContainer(children: [
          CustomTextField(controller: _viewModel.emailController, hintText: Constants.get.textConstant.email),
          SizedBox(height: context.dynamicHeight(0.03)),
          CustomTextField(
              obscureText: true,
              controller: _viewModel.passwordController,
              hintText: Constants.get.textConstant.password),
          SizedBox(height: context.dynamicHeight(0.03)),
          CustomTextField(
              obscureText: true,
              controller: _viewModel.passwordCheckController,
              hintText: Constants.get.textConstant.password),
          SizedBox(height: context.dynamicHeight(0.03)),
          CustomElevatedButton(
              text: Constants.get.textConstant.register,
              height: 40,
              width: 80,
              onTap: () {
                _viewModel.allListeners();
                _viewModel.createUser();
              },
              mainAxisAlignment: MainAxisAlignment.center),
          SizedBox(height: context.dynamicHeight(0.03)),
        ])),
      );
    }));
  }
}
