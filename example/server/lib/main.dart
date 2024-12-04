/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';
import 'dart:developer' as dev;

import 'package:deeplink_rpc/deeplink_rpc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:logging/logging.dart';

final deeplinkRpcServer = DeeplinRPCServerStreamChannel2();
final peer = Peer(deeplinkRpcServer.cast<String>())
  ..registerMethod(
    'command_1',
    (Parameters params) {
      return {
        'param1': 'value1',
      };
    },
  )
  ..registerMethod(
    'command_2',
    (Parameters params) {
      return {
        'param2': 'value2',
      };
    },
  );

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
  unawaited(peer.listen());

  runApp(const MyApp());
}

final _logger = Logger('DeeplinkRPCServer');

/// 1. Enable deeplinking for your application (https://docs.flutter.dev/development/ui/navigation/deep-linking)

/// 2. Declare the deeplink-rpc receiver
/// When a RPC call <scheme>://a_rpc_command/<payload> is received, the payload is decoded
/// and transmitted to the `handle` method.
// final _deeplinkRpcServer = DeeplinkRpcServer(
//   onReceive: (
//     DeeplinkRpcRequest request,
//     DeeplinkReplySend sendReply,
//   ) {
// },
// );

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
          unawaited(deeplinkRpcServer.server.receive(state.uri));
          return null;
        },
      ),
    );
  }
}
