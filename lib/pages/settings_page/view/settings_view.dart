import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mars_case/pages/settings_page/viewmodel/settings_viewmdel.dart';
import 'package:mars_case/widgets/custom_appbar.dart';
import 'package:mars_case/widgets/custom_container.dart';
import 'package:mars_case/widgets/custom_elevated_button.dart';

import '../../../core/constant/text_constant.dart';

class SettingsView extends StatelessWidget {
  SettingsView({Key? key}) : super(key: key);

  final _viewModel = SettingsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Constants.get.textConstant.settings),
      body: _customContainer(context),
    );
  }

  Center _customContainer(BuildContext context) {
    return Center(child: Observer(builder: (_) {
      return CustomContainer(crossAxisAlignment: CrossAxisAlignment.center, children: [
        _allNotesDeleteButton(context),
        const SizedBox(height: 50),
        _signOutButton(context),
      ]);
    }));
  }

  CustomElevatedButton _allNotesDeleteButton(BuildContext context) {
    return CustomElevatedButton(
        text: Constants.get.textConstant.deleteAllNotes,
        height: 50,
        width: 200,
        onTap: () async {
          await _viewModel.allNotesDelete(context);
        },
        mainAxisAlignment: MainAxisAlignment.center);
  }

  CustomElevatedButton _signOutButton(BuildContext context) {
    return CustomElevatedButton(
        text: Constants.get.textConstant.signOut,
        height: 50,
        width: 200,
        onTap: () async {
          await _viewModel.settingSignOut(context);
        },
        mainAxisAlignment: MainAxisAlignment.center);
  }
}
