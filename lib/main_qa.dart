import 'package:flutter/material.dart';
import 'package:flutter_custom_template/app_page.dart';
import 'package:flutter_custom_template/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MainPage());
}
