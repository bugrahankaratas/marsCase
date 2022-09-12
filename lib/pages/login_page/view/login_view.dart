import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_case/pages/sign_in_page/view/sign_in_view.dart';
import 'package:mars_case/widgets/custom_container.dart';
import 'package:mars_case/widgets/custom_elevated_button.dart';
import 'package:mars_case/widgets/custom_textfield.dart';

import '../../../widgets/custom_appbar.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Login'),
      body: Center(
        child: CustomContainer(children: [
          CustomTextField(controller: _emailController, hintText: 'E-Mail'),
          SizedBox(height: context.dynamicHeight(0.03)),
          CustomTextField(controller: _passwordController, hintText: 'Password'),
          SizedBox(height: context.dynamicHeight(0.03)),
          CustomElevatedButton(
              text: 'Login', height: 40, width: 80, onTap: () {}, mainAxisAlignment: MainAxisAlignment.center),
          SizedBox(height: context.dynamicHeight(0.03)),
          Center(
            child: CustomElevatedButton(
                text: 'Sign in',
                height: 40,
                width: 300,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                },
                mainAxisAlignment: MainAxisAlignment.center),
          ),
        ]),
      ),
    );
  }
}
