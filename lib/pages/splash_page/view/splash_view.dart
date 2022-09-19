import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/navigation_constant.dart';
import '../../../core/helper/statefull_wrapper.dart';
import '../../../utils/navigation_manager/navigation_manager.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
        onInit: () async {
          await Future.delayed(const Duration(seconds: 1));

          FirebaseAuth.instance.currentUser == null
              ? NavigationManager.instance.navigateToPageClear(path: NavConstant.loginView)
              : NavigationManager.instance.navigateToPageClear(path: NavConstant.passwordView);
        },
        child: Scaffold(
          body: Center(child: Image.asset('assets/mars_logo.png')),
        ));
  }
}
