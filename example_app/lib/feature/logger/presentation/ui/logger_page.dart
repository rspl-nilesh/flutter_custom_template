import 'package:example_app/feature/logger/presentation/bloc/logger_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_logger/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class LoggerPage extends StatelessWidget {
  const LoggerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Looger'),
        ),
        body: BlocProvider<LoggerBloc>(
          create: (context) => serviceLocator(),
          child: _LoggerPageBody(),
        ),
      );
}

class _LoggerPageBody extends StatelessWidget {
  const _LoggerPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            BlocProvider.of<LoggerBloc>(context).add(LoggerEvent(
                level: Level.debug, message: "this is debug messge"));
          },
          child: Text('Log d'),
        ),
      ),
    );
  }
}
