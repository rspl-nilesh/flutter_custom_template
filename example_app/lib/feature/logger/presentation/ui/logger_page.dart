import 'package:example_app/feature/logger/domain/usecase/log_event_usecase.dart';
import 'package:example_app/feature/logger/presentation/bloc/logger_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_logger/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_logger/response/status.dart';
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
    return BlocListener<LoggerBloc, LoggerState>(
      listener: (context, state) {
        if (state.sendEmailLogResource != null) {
          if (state.sendEmailLogResource!.status == STATUS.success) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Email sent')));
          } else if (state.sendEmailLogResource!.status == STATUS.error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.sendEmailLogResource?.failure?.message ??
                    "Something went wrong")));
          }
        }
      },
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<LoggerBloc>(context).add(AddLogEvent(
                    level: Level.debug, message: "this is debug message"));
              },
              child: const Text('Log d'),
            ),
            BlocBuilder<LoggerBloc, LoggerState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<LoggerBloc>(context).add(EmailLogEvent());
                  },
                  child: state.sendEmailLogResource != null &&
                          state.sendEmailLogResource?.status == STATUS.loading
                      ? const CircularProgressIndicator()
                      : const Text('Send Log'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
