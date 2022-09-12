import 'package:flutter/material.dart';
import 'package:mars_case/widgets/custom_container.dart';
import 'package:mars_case/widgets/custom_elevated_button.dart';
import 'package:mars_case/widgets/custom_textfield.dart';

import 'package:kartal/kartal.dart';

class PasswordView extends StatelessWidget {
  PasswordView({
    Key? key,
  }) : super(key: key);
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: Center(
        child: CustomContainer(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: context.dynamicHeight(0.05)),
            Text('Enter Your Password',
                style: context.textTheme.headline2?.copyWith(fontSize: 25, color: Colors.white)),
            SizedBox(height: context.dynamicHeight(0.05)),
            CustomTextField(controller: _passwordController, hintText: 'Password'),
            SizedBox(height: context.dynamicHeight(0.05)),
            CustomElevatedButton(
                text: 'Login',
                height: context.dynamicHeight(0.05),
                width: context.dynamicWidth(0.7),
                onTap: () {},
                mainAxisAlignment: MainAxisAlignment.center)
          ],
        ),
      ),
    );
  }
}
