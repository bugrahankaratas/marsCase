import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/constant/navigation_constant.dart';
import '../../../core/helper/loading_manager/loading_manager.dart';
import '../../../service/firebase_auth.dart';
import '../../../service/service.dart';
import '../../../utils/navigation_manager/navigation_manager.dart';

part 'settings_viewmdel.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store {
  @action
  Future allNotesDelete(BuildContext context) async {
    await LoadingManager.instance.showLoading(context);
    await Service.instance.deleteAll();
    await LoadingManager.instance.hideLoading(context);
    await NavigationManager.instance.navigateToPageClear(path: NavConstant.menuView);
  }

  @action
  Future settingSignOut(context) async {
    await LoadingManager.instance.showLoading(context);
    await FBAuth.instance.signOut();
    await LoadingManager.instance.hideLoading(context);
    await NavigationManager.instance.navigateToPageClear(path: NavConstant.loginView);
  }
}
