import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_case/pages/login_page/view/login_view.dart';
import 'package:mars_case/widgets/custom_elevated_button.dart';
import 'package:mars_case/widgets/custom_textfield.dart';

import '../../../widgets/custom_appbar.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCheckController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            icon: const Icon(Icons.chevron_left, color: Colors.brown),
          )),
      body: Center(
        child: Container(
          height: context.dynamicHeight(0.4),
          width: context.dynamicWidth(0.8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.brown,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 20,
                blurRadius: 20,
                offset: const Offset(0, 9),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(controller: _emailController, hintText: 'E-Mail'),
                  SizedBox(height: context.dynamicHeight(0.03)),
                  CustomTextField(controller: _passwordController, hintText: 'Password'),
                  SizedBox(height: context.dynamicHeight(0.03)),
                  CustomTextField(controller: _passwordCheckController, hintText: 'Password'),
                  SizedBox(height: context.dynamicHeight(0.03)),
                  CustomElevatedButton(
                      text: 'Sign In',
                      height: 40,
                      width: 80,
                      onTap: () {},
                      mainAxisAlignment: MainAxisAlignment.center),
                  SizedBox(height: context.dynamicHeight(0.03)),
                ]),
          ),
        ),
      ),
    );
  }
}
