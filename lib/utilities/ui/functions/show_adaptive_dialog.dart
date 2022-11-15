import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> showAdaptiveDialog({
  required String title,
  required String content,
}) {
  Widget dialog;
  if (Platform.isIOS) {
    dialog = CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: Get.back,
          child: const Text('ok'),
        )
      ],
    );
  } else {
    dialog = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: Get.back,
          child: const Text('ok'),
        )
      ],
    );
  }

  return Get.dialog<dynamic>(dialog);
}
