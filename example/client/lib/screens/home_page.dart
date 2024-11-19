import 'dart:convert';

import 'package:deeplink_rpc/deeplink_rpc.dart';
import 'package:deeplink_rpc_client_example/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _SendRequestButton(),
      appBar: AppBar(
        title: const Text('Client example - Home page'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: TextButton(
              onPressed: () => context.go('/other_page'),
              child: const Text('Go to other page'),
            ),
          ),
        ),
      ),
    );
  }
}

class _SendRequestButton extends StatelessWidget {
  _SendRequestButton();

  final _logger = Logger('HomePage');

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.send),
      onPressed: () async {
        final response = await deeplinkRpcClient.send(
          request: DeeplinkRpcRequest(
            requestUrl: 'deeplinkrpcserverexample://rpc.deeplink.server/',
            // requestUrl: 'http://192.168.1.22:8081/',
            replyUrl: 'http://192.168.1.22:8081/',
            // replyUrl: 'deeplinkrpcclientexample://rpc.deeplink.client/',
            params: {
              'command': 'command_1',
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
