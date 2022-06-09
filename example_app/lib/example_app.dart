import 'package:example_app/feature/logger/presentation/ui/logger_page.dart';
import 'package:flutter/material.dart';

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(),
      body: const LoggerPage(),
    );
}
