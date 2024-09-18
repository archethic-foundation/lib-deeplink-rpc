/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:convert';

import 'package:deeplink_rpc/deeplink_rpc.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

void main() {
  runApp(MyApp());
}

final _deeplinkRpcClient = DeeplinkRpcClient();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _messengerKey = GlobalKey<ScaffoldMessengerState>();
  final _logger = Logger('Example app');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      title: 'DeeplinkRPC Demo',
      onGenerateRoute: (settings) {
        if (_deeplinkRpcClient.handleRoute(settings.name)) return;
        return null;
      },
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.send),
          onPressed: () async {
            final response = await _deeplinkRpcClient.send(
              timeout: const Duration(seconds: 5),
              request: DeeplinkRpcRequest(
                requestUrl: 'serverapp://server.app/request_endpoint',
                replyUrl: 'clientapp://client.app/reply_endpoint',
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
                _messengerKey.currentState?.showSnackBar(
                  SnackBar(
                    content: Text(failure.message ?? 'An error occured'),
                  ),
                );
              },
              success: (result) {
                _logger.info(
                  'RPC request succeed : ${json.encode(result)}',
                );
                _messengerKey.currentState?.showSnackBar(
                  SnackBar(content: Text(json.encode(result))),
                );
              },
            );
          },
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text('Client example'),
            ),
          ),
        ),
      ),
    );
  }
}
