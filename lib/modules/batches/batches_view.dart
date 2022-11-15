import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../settings/settings_controller.dart';

class BatchesView extends GetView<SettingsController> {
  const BatchesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Batches'),
        centerTitle: true,
        actions: const <Widget>[],
      ),
      body: Container(),
    );
  }
}
