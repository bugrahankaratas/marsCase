import 'package:flutter/material.dart';
import 'package:mars_case/pages/add_notes_page/view/add_notes_view.dart';
import 'package:mars_case/pages/login_page/view/login_view.dart';
import 'package:mars_case/pages/menu_page/view/menu_view.dart';
import 'package:mars_case/pages/password_page/view/password_view.dart';
import 'package:mars_case/pages/register_page/view/register_view.dart';
import 'package:mars_case/pages/settings_page/view/settings_view.dart';
import 'package:mars_case/pages/splash_page/view/splash_view.dart';

import '../../core/constant/navigation_constant.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavConstant.splashView:
        return defaultNavigate(const SplashView());
      case NavConstant.loginView:
        return defaultNavigate(LoginView());
      case NavConstant.registerView:
        return defaultNavigate(RegisterView());
      case NavConstant.passwordView:
        return defaultNavigate(PasswordView());
      case NavConstant.addNotesView:
        return defaultNavigate(AddNotesView());
      case NavConstant.menuView:
        return defaultNavigate(MenuView());
      case NavConstant.settingsView:
        return defaultNavigate(SettingsView());

      default:
        return defaultNavigate(MenuView());
    }
  }

  MaterialPageRoute defaultNavigate(Widget widget) => MaterialPageRoute(builder: (context) => widget);
}
