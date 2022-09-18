import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mars_case/pages/login_page/view/login_view.dart';
import 'package:mars_case/pages/password_page/view/password_view.dart';

import '../../../core/helper/statefull_wrapper.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
        onInit: () async {
          await Future.delayed(const Duration(seconds: 1));

          FirebaseAuth.instance.currentUser == null
              ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()))
              : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PasswordView()));
        },
        child: Scaffold(
          body: Center(child: Image.asset('assets/mars_logo.png')),
        ));
  }
}
