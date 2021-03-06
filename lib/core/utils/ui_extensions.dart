import 'package:flutter/material.dart';
import 'package:flutter_custom_template/app_page.dart';

extension Alerts on BuildContext {
  Future<void> showAlertDialog({
    required String message,
    String? title,
    TextButton? positiveButton,
    TextButton? negativeButton,
  }) async {
    await showDialog(
      context: this,
      builder: (_) => AlertDialog(
        title: title != null ? Text(title) : null,
        content: Text(message),
        actions: negativeButton != null || positiveButton != null
            ? <Widget>[
                negativeButton ?? Container(),
                positiveButton ?? Container()
              ]
            : null,
      ),
    );
  }
}

extension SnackbarMessage on BuildContext {
  void showSnackBar({required String message}) {
    snackbarKey.currentState?.showSnackBar(SnackBar(content: Text(message)));
  }
}
