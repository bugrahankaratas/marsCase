import 'package:flutter/material.dart';
import 'package:mars_case/helper/loading_manager/loading_manager.dart';
import 'package:mars_case/pages/login_page/view/login_view.dart';
import 'package:mars_case/service/firebase_auth.dart';
import 'package:mars_case/service/service.dart';
import 'package:mars_case/widgets/custom_appbar.dart';
import 'package:mars_case/widgets/custom_container.dart';
import 'package:mars_case/widgets/custom_elevated_button.dart';

import '../../menu_page/view/menu_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Ayarlar'),
      body: Center(
          child: CustomContainer(crossAxisAlignment: CrossAxisAlignment.center, children: [
        CustomElevatedButton(
            text: 'Tüm Notları Sil',
            height: 50,
            width: 200,
            onTap: () async {
              await LoadingManager.instance.showLoading(context);
              await Service.instance.deleteAll();
              await LoadingManager.instance.hideLoading(context);
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => MenuView()),
                (route) => false,
              );
            },
            mainAxisAlignment: MainAxisAlignment.center),
        const SizedBox(height: 50),
        CustomElevatedButton(
            text: 'Oturum Kapat',
            height: 50,
            width: 200,
            onTap: () {
              FBAuth.instance.signOut();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginView()),
                (route) => false,
              );
            },
            mainAxisAlignment: MainAxisAlignment.center)
      ])),
    );
  }
}
