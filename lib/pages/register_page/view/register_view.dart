import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_case/service/firebase_auth.dart';

import '../../../helper/statefull_wrapper.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_textfield.dart';
import '../../login_page/view/login_view.dart';
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
            title: 'Sign In',
            leading: IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
              icon: const Icon(Icons.chevron_left, color: Colors.white),
            )),
        body: Center(
            child: CustomContainer(children: [
          CustomTextField(controller: _viewModel.emailController, hintText: 'E-Mail'),
          SizedBox(height: context.dynamicHeight(0.03)),
          CustomTextField(controller: _viewModel.passwordController, hintText: 'Password'),
          SizedBox(height: context.dynamicHeight(0.03)),
          CustomTextField(controller: _viewModel.passwordCheckController, hintText: 'Password'),
          SizedBox(height: context.dynamicHeight(0.03)),
          CustomElevatedButton(
              text: 'Sign In',
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
