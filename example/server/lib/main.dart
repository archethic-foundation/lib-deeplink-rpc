/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:developer' as dev;

import 'package:deeplink_rpc/deeplink_rpc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

void main() {
  Logger.root.onRecord.listen((event) {
    dev.log(
      event.message,
      name: event.loggerName,
      error: event.error,
      stackTrace: event.stackTrace,
      level: event.level.value,
      time: event.time,
      sequenceNumber: event.sequenceNumber,
      zone: event.zone,
    );
  });

  runApp(const MyApp());
}

final _logger = Logger('DeeplinkRPCServer');

/// 1. Enable deeplinking for your application (https://docs.flutter.dev/development/ui/navigation/deep-linking)

/// 2. Declare the deeplink-rpc receiver
/// When a RPC call <scheme>://a_rpc_command/<payload> is received, the payload is decoded
/// and transmitted to the `handle` method.
final _deeplinkRpcServer = DeeplinkRpcServer()
  ..registerHandler(
    DeeplinkRpcRequestHandler(
      route: const DeeplinkRpcRoute('/'),
      handle: (request) async {
        final command = request.params['command'];
        switch (command) {
          case 'command_1':
            _logger.info('Command 1 received');
            return {
              'message': 'Command 1 succeeds !',
            };
          case 'command_2':
            _logger.info('Command 2 received');
            return {
              'message': 'Command 2 succeeds !',
            };
          default:
            throw DeeplinkRpcFailure(
              code: DeeplinkRpcFailure.kInvalidRequest,
              message: 'Invalid command : $command',
            );
        }
      },
    ),
  );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DeeplinkRPCServer Demo',
      routerConfig: GoRouter(
        initialLocation: '/',
        debugLogDiagnostics: true,
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text('DeeplinkRPCServer example'),
                  ),
                ),
              ),
            ),
          ),
        ],
        redirect: (context, state) async {
          final uriString = state.uri.toString();
          if (_deeplinkRpcServer.canHandle(uriString)) {
            await _deeplinkRpcServer.handle(uriString);
          }
          return null;
        },
      ),
    );
  }
}
