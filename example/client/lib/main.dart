/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:developer' as dev;

import 'package:deeplink_rpc/deeplink_rpc.dart';
import 'package:deeplink_rpc_client_example/screens/home_page.dart';
import 'package:deeplink_rpc_client_example/screens/other_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

DeeplinkRpcClient deeplinkRpcClient = DeeplinkRpcClient();

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DeeplinkRPCClient Demo',
      routerConfig: GoRouter(
        initialLocation: '/',
        debugLogDiagnostics: true,
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomePage(),
            routes: [
              GoRoute(
                path: 'other_page',
                builder: (context, state) => const OtherPage(),
              ),
            ],
          ),
        ],
        redirect: (context, state) async {
          deeplinkRpcClient.handleResponse(state.uri);
          return null;
        },
      ),
    );
  }
}
