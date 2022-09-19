import 'package:flutter/material.dart';

import 'navigation_interface.dart';

class NavigationManager implements NavigationInterface {
  static final NavigationManager _instance = NavigationManager._init();
  static NavigationManager get instance => _instance;

  NavigationManager._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Future<void> navigateToPage({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path, (route) => false, arguments: data);
  }

  @override
  Future<void> navigatePop() async {
    navigatorKey.currentState!.pop();
  }
}
