/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:convert';
import 'dart:developer' as dev;

import 'package:deeplink_rpc/deeplink_rpc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

class DeeplinkRpcClientSingleton {
  static DeeplinkRpcClient? _client;

  static DeeplinkRpcClient get client {
    return _client ??= DeeplinkRpcClient();
  }
}

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

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _logger = Logger('Example app');

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
            builder: (context, state) {
              return Scaffold(
                body: Scaffold(
                  floatingActionButton: _SendRequestButton(logger: _logger),
                  body: const SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text('DeeplinkRPCClient example'),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
        redirect: (context, state) async {
          DeeplinkRpcClientSingleton.client
              .handleResponse(state.uri.toString());
          return null;
        },
      ),
    );
  }
}

class _SendRequestButton extends StatelessWidget {
  const _SendRequestButton({
    required Logger logger,
  }) : _logger = logger;

  final Logger _logger;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.send),
      onPressed: () async {
        final response = await DeeplinkRpcClientSingleton.client.send(
          request: DeeplinkRpcRequest(
            requestUrl:
                'deeplinkrpcserverexample://rpc.deeplink.server/request_endpoint/',
            replyUrl: 'deeplinkrpcclientexample://rpc.deeplink.client/',
            params: {
              'param1': 'value1',
              'param2': 'value2',
            },
          ),
        );

        response.map(
          failure: (failure) {
            _logger.severe(
              'RPC request failed',
              failure,
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(failure.message ?? 'An error occured'),
              ),
            );
          },
          success: (result) {
            _logger.info(
              'RPC request succeed : ${json.encode(result)}',
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(json.encode(result))),
            );
          },
        );
      },
    );
  }
}
