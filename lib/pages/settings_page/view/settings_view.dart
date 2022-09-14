import 'package:flutter/material.dart';
import 'package:mars_case/widgets/custom_appbar.dart';
import 'package:mars_case/widgets/custom_container.dart';
import 'package:mars_case/widgets/custom_elevated_button.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Ayarlar'),
      body: Center(
          child: CustomContainer(crossAxisAlignment: CrossAxisAlignment.center, children: [
        CustomElevatedButton(
            text: 'Tüm Notları Sil', height: 50, width: 200, onTap: () {}, mainAxisAlignment: MainAxisAlignment.center),
        const SizedBox(height: 50),
        CustomElevatedButton(
            text: 'Oturum Kapat', height: 50, width: 200, onTap: () {}, mainAxisAlignment: MainAxisAlignment.center)
      ])),
    );
  }
}
