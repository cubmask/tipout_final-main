import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'activity_controller.dart';

class ActivityView extends GetView<ActivityController> {
  const ActivityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Activity'),
        centerTitle: true,
        actions: const <Widget>[],
      ),
      body: Container(),
    );
  }
}
