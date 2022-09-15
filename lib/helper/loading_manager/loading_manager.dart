import 'package:flutter/material.dart';

import '../../widgets/custom_progresindicator.dart';

class LoadingManager {
  static LoadingManager? _instance;
  static LoadingManager get instance {
    return _instance ??= LoadingManager();
  }

  bool _isPopupShow = false;

  Future showLoading(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const CustomProgressIndicator(color: Colors.white, size: 40);
      },
    );
    _isPopupShow = true;
  }

  Future hideLoading(BuildContext context) async {
    if (_isPopupShow) {
      _isPopupShow = false;
      Navigator.of(context).pop();
    }
  }
}
