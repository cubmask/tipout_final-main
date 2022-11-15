import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tipout_final/routes/app_pages.dart';
import 'package:tipout_final/theme/styles.dart';
import 'bindings/app_binding.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(
          'https://formrecognizerblazorwasmserver20220824055423.azurewebsites.net'),
      title: 'TipOut',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
